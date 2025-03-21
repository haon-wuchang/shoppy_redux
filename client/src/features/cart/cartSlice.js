import { createSlice } from '@reduxjs/toolkit' ;

const initialState = {   // json 형식으로 사용할 초기값 생성
    cartCount : 0 ,
    totalPrice : 0 ,
    cartList : [] ,
    isAdded : false,
}

export const cartSlice = createSlice({
  name: 'cart',   // store 에 등록할 이름 , useSlector 가 사용할이름
  initialState,
  reducers: {
    // 함수 선언할 곳
    setCartCount(state, action){  // api 에서 넘어오는 값이 있을때만 action 이 필요하다
        // console.log('cartSlice_cartCount',action.payload.resultCount);
        state.cartCount = action.payload.resultCount;
    },
    clearCartCount(state){
        state.cartCount = 0 ;
    },setCartList(state, action){
      state.cartList = action.payload.result;
    },cartListReset(state){
      state.cartList = [];
    },setTotalPrice(state,action){
      const list = action.payload.result;
      state.totalPrice = list.reduce((sum, item) => sum + item.price * item.qty, 0);
    },setIsAdded(state, action){
      if(action.payload.result_rows){
        state.isAdded = true;       
      }
    },setIsAddedReset(state){
      state.isAdded = false;
    }
  },
})

// 사용할 애 return 하기
export const {setCartCount,clearCartCount,setCartList,
    cartListReset,setTotalPrice, setIsAdded, setIsAddedReset } = cartSlice.actions

export default cartSlice.reducer