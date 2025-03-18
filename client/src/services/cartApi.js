import { axiosPost } from "./api.js";
import { setCartCount, clearCartCount ,setCartList,cartListReset } from '../features/cart/cartSlice.js';

/** * 장바구니 전체 카운트 조회 */
export const getCount = () => async (dispatch) => {
    const url = 'http://localhost:9000/cart/count';
    const id = localStorage.getItem("user_id");
    const data = { 'id': id };

    const result = await axiosPost({ url, data });
    const resultCount = result.count;
    dispatch(setCartCount({ resultCount }));  // 얘한테 db 결과 바로 못넘겨서 위에 변수선언후에 걔를 넘겨줘야함 그리고 객체로 묶어줘야함
}

/** * 장바구니 카운트 초기화 */
export const clearCount = () => (dispatch) => {
    dispatch(clearCartCount());
}

/*** 장바구니 전체 리스트 조회*/
export const getCartList = () => async(dispatch) => {
    const id = localStorage.getItem("user_id");
    const url = 'http://localhost:9000/cart/items';
    const data = {'id':id};

    const result = await axiosPost({ url, data });
    dispatch(setCartList({result}));  // {result : result}
    // setCartCount(result.data.length);
    // calculateTotalPrice(result.data);
}
// 로그아웃상태에서 장바구니 초기화
export const clearCartList = () => (dispatch) => {
    dispatch(cartListReset());
}