import { createSlice } from '@reduxjs/toolkit' ;

const initialState = {   // json 형식으로 사용할 초기값 생성
    orderList : [],
    member : {} ,
    //saveToOrder 성공 여부 체크할 애 선언
    isSaveSuccess : false,

}

export const orderSlice = createSlice({
  name: 'order',   // store 에 등록할 이름 , useSlector 가 사용할이름
  initialState,
  reducers: {
    // 함수 선언할 곳
    setOrderList(state, action){
        state.orderList = action.payload.result;
    },
    setMember(state, action){
        state.member = action.payload.member;
    },setIsSaveSuccess(state, action){
      if(action.payload.result_rows) state.isSaveSuccess = true;
    },
  },
})

// 사용할 애 return 하기
export const { setOrderList,setMember, setIsSaveSuccess} = orderSlice.actions

export default orderSlice.reducer