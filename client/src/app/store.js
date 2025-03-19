import { configureStore } from '@reduxjs/toolkit';
import  authSlice  from '../features/auth/authSlice.js';
import cartSlice  from '../features/cart/cartSlice.js';
import  orderSlice  from '../features/order/orderSlice.js';

//로컬스토리지에 저장된 리덕스 상태값 가져오기
const loadState = () =>{
  try {
      const serializedState = localStorage.getItem('reduxState');
  } catch (error) {
    
  }
}

export const store = configureStore({
  reducer: {
    /* 리듀서 = 슬라이스 등록 */
    login : authSlice,
    cart: cartSlice,
    order : orderSlice,
  },
})

// 로컬스토리지에 리덕스 상태값 저장하기
store.