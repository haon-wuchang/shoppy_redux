import { setOrderList, setMember ,setIsSaveSuccess} from '../features/order/orderSlice.js';
import { axiosPost } from './api.js';

/**
 * 전체 주문정보 가져오기 : getOrderList
 */
export const getOrderList = () => async (dispatch) => {
    // 얘는콜백형식으로도 쓰임 export const getOrderList =  () => {
    // async(dispatch) {
    //}
    //}
    const id = localStorage.getItem("user_id");
    const url = 'http://localhost:9000/order/all';
    const data = { "id": id };

    const result = await axiosPost({ url, data });
    const member = result[0];
    dispatch(setOrderList({ result }));
    dispatch(setMember({ member }));
}
/**
 * 카카오페이 결제 요청 : paymentKakaoPay
 */
export const paymentKakaoPay = (totalPrice, orderList) => async (dispatch) => {
    const id = localStorage.getItem("user_id");
    const url = 'http://localhost:9000/payment/qr';
    const pname = orderList[0].pname.concat(" 외");
    const type = "KAKAO_PAY";
    const data = {
        id: id,
        item_name: pname,
        total_amount: totalPrice, // 결제 금액 (KRW)
        formData: {
            id: id,
            type: type,
            totalPrice: totalPrice,
            orderList: orderList
        }
    };
    const response = await axiosPost({ url, data });

    if (response.next_redirect_pc_url) {
        response.tid && localStorage.setItem("tid", response.tid);
        window.location.href = response.next_redirect_pc_url;
    } // 이게 윈도우로케이션으로넘기면 해당하는 주소로 넘어가서 새로고침하는거랑 똑같음 음..그래서 메모리값이 다 지워진다

}
/**
 * 결제 완료 후 장바구니 주문내역을 주문테이블 저장 : saveToOrder
 */
export const saveToOrder = (totalPrice,orderList) => async (dispatch) => {
    const id = localStorage.getItem("user_id");
    const tid = localStorage.getItem("tid");
    const type = "KAKAO_PAY";
    const url = 'http://localhost:9000/order/add';
    const data = {
        id: id,
        tid: tid,
        type: type,
        totalPrice: totalPrice,
        orderList: orderList
    };

    try {
        const result = await axiosPost({url,data});
        if (result.result_rows) {
            const result_rows = result.result_rows;
            console.log('주문테이블 저장 성공!!');
            dispatch(setIsSaveSuccess({result_rows}));
        }
    } catch (error) {
        console.error("주문테이블 저장 실패:", error);
    }
}