# 🚚 LoadMate

LoadMate is a smart freight booking and logistics platform. This project consists of a full-stack application featuring a Python FastAPI backend and a React (Vite) frontend, designed with a visually stunning Glassmorphism UI and dynamic price calculators.

## 🚀 Quick Start Guide

This guide will show you how to start both the frontend and backend servers locally using the integrated VS Code Terminal.

### Prerequisites
Make sure you have the following installed on your machine:
- **Node.js** (for running the frontend)
- **Python 3** (for running the backend)

---

### Step 1: Run the Backend (FastAPI)
The backend handles API requests, database interactions, and real-time WebSocket connections.

1. Open a new terminal in VS Code (`Ctrl` + `~` or `Terminal` > `New Terminal`).
2. Navigate to the backend directory:
   ```bash
   cd backend
   ```
3. Activate the virtual environment (Windows):
   ```bash
   .\venv\Scripts\activate
   ```
   *(Note: If your environment isn't set up yet, you can create it with `python -m venv venv` and install the dependencies using `pip install -r requirements.txt`)*
4. Start the backend server:
   ```bash
   python -m uvicorn main:app --reload
   ```
   *The backend will now be running at `http://localhost:8000`.*

---

### Step 2: Run the Frontend (React + Vite)
The frontend contains the interactive booking platform, the dynamic truck pricing engine, and the visual checkout flow.

1. Open a **second** new terminal in VS Code (Leave your backend terminal running!).
2. Navigate to the frontend directory:
   ```bash
   cd company-web
   ```
3. Install the Node modules (if you haven't recently):
   ```bash
   npm install
   ```
4. Start the frontend development server:
   ```bash
   npm run dev
   ```
   *The frontend will now be running at `http://localhost:5174`.*

---

### Step 3: Present the Application
Open your web browser and click on the local link provided by your Vite terminal (usually **http://localhost:5174**).

🎉 **You are all set!** 
- You can navigate the Home page to search for shared routes.
- You can click the ⭐ New Custom Booking button to test out the dynamic FTL vs LTL dual-pricing engine you just configured!
