import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Houses from './Houses';
import Families from './Families';
import Individuals from './Individuals';
import Needs from './Needs';
import './App.css'; // Importing the enhanced CSS file for styling

const App = () => {
  return (
    <Router>
      <div className="app-container">
        {/* Navigation Links */}
        <nav className="navbar">
          <ul className="nav-list">
            <li className="nav-item"><Link to="/houses">البيوت</Link></li>
            <li className="nav-item"><Link to="/families">العائلات</Link></li>
            <li className="nav-item"><Link to="/individuals">الأفراد</Link></li>
            <li className="nav-item"><Link to="/needs">الاحتياجات</Link></li>
          </ul>
        </nav>

        {/* Define Routes */}
        <div className="content">
          <Routes>
            <Route path="/houses" element={<Houses />} />
            <Route path="/families" element={<Families />} />
            <Route path="/individuals" element={<Individuals />} />
            <Route path="/needs" element={<Needs />} />
            
            {/* Default Route */}
            <Route path="/" element={
              <div className="welcome">
                <h1>مرحبا بك في تطبيق إدارة البيانات</h1>
                <p>يرجى اختيار قسم من القائمة للتنقل.</p>
              </div>
            } />
          </Routes>
        </div>
      </div>
    </Router>
  );
};

export default App;
