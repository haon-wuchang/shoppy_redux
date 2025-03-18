import { createSlice } from '@reduxjs/toolkit' ;

const initialState = {   // json 형식으로 사용할 초기값 생성
    isLoggedIn : false ,
    isError : false,
}

export const authSlice = createSlice({
  name: 'login',   // store 에 등록할 이름 , useSlector 가 사용할이름
  initialState,
  reducers: {
    // 함수 선언할 곳
    setIsLoggedIn(state,action){
      // state 는 자기자신이 가지고잇는 변수 선택 시 사용
     // action은 외부에서 넘어오는 파라미터를 받을때 사용( 파라미터가 여러개 넘어올수잇어서 payload 라는 박스? 에 값들을 쌓아둔다)
     console.log('action',action.payload.result_rows);
     if(action.payload.result_rows){
        state.isLoggedIn = true;
     }else {
      state.isError = true;
     }      
    } ,
    setIsLogout(state){
      state.isLoggedIn = false;
    },
    setLoginReset(state){
      state.isError = false;
    }
  },
})

// Action creators are generated for each case reducer function
// 사용할 애 return 하기
export const { setIsLoggedIn, setIsLogout , setLoginReset} = authSlice.actions

export default authSlice.reducer