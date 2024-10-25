import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './Persons.css';

const FulfilledNeeds = () => {
  const [fulfilledNeeds, setFulfilledNeeds] = useState([]);
  const [houses, setHouses] = useState([]);
  const [families, setFamilies] = useState([]);
  const [individuals, setIndividuals] = useState([]);

  useEffect(() => {
    fetchFulfilledNeeds();
    fetchAdditionalData();
  }, []);

  // Fetch fulfilled needs
  const fetchFulfilledNeeds = () => {
    axios.get('http://localhost:5000/needs/fulfilled/1')
      .then(response => {
        setFulfilledNeeds(response.data);
      })
      .catch(error => console.error('Error fetching fulfilled needs:', error));
  };

  // Fetch additional data for houses, families, and individuals
  const fetchAdditionalData = () => {
    axios.all([
      axios.get('http://localhost:5000/houses'),
      axios.get('http://localhost:5000/families'),
      axios.get('http://localhost:5000/individuals')
    ])
    .then(axios.spread((housesRes, familiesRes, individualsRes) => {
      setHouses(housesRes.data);
      setFamilies(familiesRes.data);
      setIndividuals(individualsRes.data);
    }))
    .catch(error => console.error('Error fetching additional data:', error));
  };

  // Helper function to get the related label
  const getRelatedLabel = (need) => {
    if (need.house_id) {
      const house = houses.find(h => h.id === need.house_id);
      return house ? house.house_label : 'N/A';
    } else if (need.individual_id) {
      const individual = individuals.find(i => i.id === need.individual_id);
      return individual ? individual.name : 'N/A';
    } else if (need.family_id) {
      const family = families.find(f => f.id === need.family_id);
      return family ? family.family_head : 'N/A';
    } else {
      return 'N/A';
    }
  };

  return (
    <div className="persons-container" style={{ direction: 'rtl' }}>
      <h1>مساعدات مكتملة</h1>

      {/* Fulfilled Needs Table */}
      <table className="persons-table">
        <thead>
          <tr>
            <th>حصة غذائية</th>
            <th>أدوية</th>
            <th>فرش</th>
            <th>ملابس</th>
            <th>مواد تنظيف</th>
            <th>المعرف المرتبط</th>
          </tr>
        </thead>
        <tbody>
          {fulfilledNeeds.map(need => (
            <tr key={need.id}>
              <td>{need.food_aid ? 'نعم' : 'لا'}</td>
              <td>{need.medicine ? 'نعم' : 'لا'}</td>
              <td>{need.furniture ? 'نعم' : 'لا'}</td>
              <td>{need.clothes ? 'نعم' : 'لا'}</td>
              <td>{need.cleaning_supplies ? 'نعم' : 'لا'}</td>
              <td>{getRelatedLabel(need)}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default FulfilledNeeds;
