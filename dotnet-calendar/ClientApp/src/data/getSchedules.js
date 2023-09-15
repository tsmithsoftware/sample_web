import axios from 'axios';

const getAllSchedules = axios.create({
  baseURL: 'http://localhost:4002',
  withCredentials: false,
  headers: {
    'Content-Type': 'application/json',
  },
});

export default getAllSchedules;