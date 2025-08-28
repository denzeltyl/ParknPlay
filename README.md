# ParkNPlay

A modern full-stack web application for finding parking spaces and nearby attractions, built with Django REST Framework and React. This project demonstrates proficiency in full-stack development, API design, and modern web technologies.

## Features

### Core Functionality
- **Interactive Map Integration**: Find nearby parking spaces using Google Maps API
- **Location Search**: Search for specific locations and attractions
- **Favorites System**: Save and manage favorite parking locations
- **User Authentication**: Secure JWT-based authentication system
- **Responsive Design**: Mobile-first responsive UI with Material-UI

### Technical Features
- RESTful API architecture
- Real-time location services
- Email integration for password reset
- Cross-origin resource sharing (CORS) configured
- SQLite database with Django ORM
- Modern React hooks and functional components

## Tech Stack

**Backend:**
- Django 5.1
- Django REST Framework 3.15
- JWT Authentication (Simple JWT)
- SQLite Database
- Python 3.11+

**Frontend:**
- React 18
- Vite 5.4
- Material-UI 6.1
- React Router 6.28
- Axios 1.7

**APIs & Services:**
- Google Maps JavaScript API
- Google Places API
- Google Geocoding API

## Quick Start

### Prerequisites

- Python 3.11+
- Node.js 16+
- Git

### One-Command Setup
```bash
git clone https://github.com/denzeltyl/ParknPlay.git
cd ParknPlay
chmod +x start.sh
./start.sh
```

The startup script will automatically:
- Create Python virtual environment
- Install all dependencies
- Run database migrations
- Start both backend and frontend servers
- Open the application in your browser

### Manual Setup
```bash
# Clone repository
git clone https://github.com/denzeltyl/ParknPlay.git
cd ParknPlay

# Backend setup
python3 -m venv .venv
source .venv/bin/activate
pip install -r backend/requirements.txt
cd backend && python manage.py migrate && python manage.py runserver &

# Frontend setup (new terminal)
cd frontend && npm install && npm run dev
```

### Access Points
- **Frontend Application**: http://localhost:5173
- **Backend API**: http://localhost:8000
- **Django Admin**: http://localhost:8000/admin

## Configuration (Optional)

The application works with default settings. For full functionality:

### Environment Setup
```bash
# Copy environment templates
cp .env.example .env
cp frontend/.env.example frontend/.env
```

### Google Maps API Integration
1. Get API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Enable APIs: Maps JavaScript API, Places API, Geocoding API
3. Update `GOOGLE_MAPS_API_KEY` in both `.env` files

### Email Configuration
For password reset functionality:
1. Configure Gmail app password
2. Update `EMAIL_HOST_USER` and `EMAIL_HOST_PASSWORD` in root `.env`

## Project Structure

```
ParkNPlay/
├── backend/                 # Django REST API
│   ├── api/                # API endpoints and models
│   │   ├── views/          # API view controllers
│   │   ├── models.py       # Database models
│   │   ├── serializers.py  # Data serialization
│   │   └── urls.py         # API routing
│   ├── backend/            # Django project settings
│   ├── templates/          # Email templates
│   └── requirements.txt    # Python dependencies
├── frontend/               # React application
│   ├── src/
│   │   ├── pages/          # Page components
│   │   ├── components/     # Reusable components
│   │   ├── styles/         # CSS modules
│   │   ├── utils/          # Helper functions
│   │   └── api.js          # API integration
│   ├── public/             # Static assets
│   └── package.json        # Node.js dependencies
├── start.sh               # Quick startup script
├── .env.example           # Environment template
└── README.md             # This file
```

## API Endpoints

### Authentication
- `POST /api/register/` - User registration
- `POST /api/token/` - Login (JWT token)
- `POST /api/token/refresh/` - Token refresh
- `POST /api/change-password/` - Change password
- `POST /api/password_reset/` - Password reset

### Core Features
- `GET /api/home/` - Health check
- `GET /api/carparks/` - Find nearby parking
- `GET /api/nearby_search/` - Location search
- `GET /api/favourites/` - Get user favorites
- `POST /api/favourites/` - Add favorite
- `DELETE /api/favourites/{id}/` - Remove favorite

## Development

### Running Tests
```bash
# Backend tests
cd backend && python manage.py test

# Frontend tests (if available)
cd frontend && npm test
```

### Building for Production
```bash
# Frontend build
cd frontend && npm run build

# Backend production server
pip install gunicorn
gunicorn backend.wsgi:application
```

### Code Quality
- ESLint configured for frontend
- Django best practices followed
- Modular component architecture
- RESTful API design principles

## Troubleshooting

### Port Conflicts
```bash
# Kill processes on development ports
lsof -ti:8000,5173 | xargs kill -9
```

### Reset Environment
```bash
# Clean reset
rm -rf .venv frontend/node_modules
./start.sh
```

### Common Issues
- **CORS errors**: Check Django CORS settings in `backend/settings.py`
- **API connection**: Verify backend is running on port 8000
- **Map not loading**: Check Google Maps API key configuration

## Key Features Demonstrated

### Backend Development
- RESTful API design and implementation
- Django ORM and database modeling
- JWT authentication and authorization
- Email integration and templates
- API documentation and testing

### Frontend Development
- Modern React development with hooks
- Component-based architecture
- State management and API integration
- Responsive design principles
- Material-UI implementation

### Full-Stack Integration
- Frontend-backend communication
- Authentication flow implementation
- Real-time data updates
- Error handling and user feedback
- Development environment setup

## Future Enhancements

- [ ] Real-time parking availability updates
- [ ] Mobile app development (React Native)
- [ ] Advanced search filters
- [ ] User reviews and ratings
- [ ] Payment integration
- [ ] Admin dashboard
- [ ] Docker containerization
- [ ] CI/CD pipeline setup