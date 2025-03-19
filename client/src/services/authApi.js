import { setIsLoggedIn , setIsLogout, setLoginReset} from "../features/auth/authSlice.js";
import Login from "../pages/Login.jsx";
import { axiosPost } from './api.js';

export const getLogin = (formData) => async (dispatch) => {
    // console.log('auth',formData);

    const url = 'http://localhost:9000/member/login';
    const data = formData;

    const loginResult = await axiosPost({url, data});
    const result_rows = loginResult.result_rows;

    if (result_rows === 1) { // 로그인 성공 시
        localStorage.setItem("token", loginResult.token);
        localStorage.setItem("user_id", formData.id);
        // 리듀서(슬라이스)의 함수를 호출하고 파라미터를 넘길때는 변수형태로 넘겨야한다
        dispatch(setIsLoggedIn({ result_rows }));
    } else { // 로그인 실패 시
        dispatch(setIsLoggedIn({ result_rows })); // 리듀서(슬라이스)의 함수를 호출
    }
}

export const getLogout = () => (dispatch) => {
    // localStorage.removeItem("token");
    // localStorage.removeItem("user_id");
    // localStorage.removeItem("reduxState");
    localStorage.clear();   // 로컬스토리지 전체 삭제
    dispatch(setIsLogout());
}

// authslice 에 가서 isError를 false 로 만드는 작업을 하는 함수
export const getLoginReset = () => (dispatch) => {
    dispatch(setLoginReset());
}


// authApi 에 따로 함수만들면 보안에 좋다 ( 컴포넌트에 만들면 걍 다 보이니까 )