import { createSlice } from '@reduxjs/toolkit' ;

const initialState = {   // json 형식으로 사용할 초기값 생성
    productList : [],

}

export const productSlice = createSlice({
  name: 'product',   // store 에 등록할 이름 , useSlector 가 사용할이름
  initialState,
  reducers: {
    // 함수 선언할 곳
    setProductList(state, action){
        state.productList = action.payload.result;
    },
  },
})

// 사용할 애 return 하기
export const { setProductList} = productSlice.actions

export default productSlice.reducer