import { configureStore } from '@reduxjs/toolkit';
import  authSlice  from '../features/auth/authSlice.js';

export const store = configureStore({
  reducer: {
    /* 리듀서 = 슬라이스 등록 */
    login : authSlice,
  },
})