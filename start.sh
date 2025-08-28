#!/bin/bash

# ParkNPlay Quick Start Script
echo "Starting ParkNPlay Application..."

# Validate directory
if [ ! -f "README.md" ] || [ ! -d "backend" ] || [ ! -d "frontend" ]; then
    echo "Error: Run this script from the ParknPlay root directory"
    exit 1
fi

# Kill any existing servers
echo "Stopping any existing servers..."
lsof -ti:8000,5173 2>/dev/null | xargs kill -9 2>/dev/null || true

# Cleanup function
cleanup() {
    echo "Shutting down servers..."
    jobs -p | xargs -r kill 2>/dev/null
    exit 0
}
trap cleanup SIGINT SIGTERM EXIT

# Setup Python environment
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
fi

echo "Setting up backend..."
source .venv/bin/activate

# Upgrade pip and install setuptools first
pip install --upgrade pip setuptools wheel -q

# Install backend dependencies
pip install -q -r backend/requirements.txt

cd backend

# Run migrations
echo "Running database migrations..."
python manage.py migrate --verbosity=0

# Start backend server
echo "Starting Django server..."
python manage.py runserver 8000 &
BACKEND_PID=$!

cd ..

# Setup frontend
echo "Setting up frontend..."
cd frontend

if [ ! -d "node_modules" ]; then
    echo "Installing frontend dependencies..."
    npm install --silent
fi

echo "Starting React server..."
npm run dev &
FRONTEND_PID=$!

cd ..

# Wait for servers to start
echo "Waiting for servers to start..."
sleep 8

# Check if servers are running
if ! curl -s http://localhost:8000/api/home/ > /dev/null; then
    echo "Warning: Backend server may not be running properly"
fi

# Display information
echo ""
echo "ParkNPlay is running:"
echo "  Frontend: http://localhost:5173"
echo "  Backend:  http://localhost:8000"
echo "  Admin:    http://localhost:8000/admin"
echo ""
echo "Press Ctrl+C to stop servers"

# Open browser
command -v open >/dev/null && open http://localhost:5173

# Keep running
wait
