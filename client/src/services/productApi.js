import { setProductList,setProduct ,setImgList,setDetailImgList, setSize} from '../features/product/productSlice.js';
import { axiosGet, axiosPost } from './api.js';

export const getProductList = () => async (dispatch) => {
    const url = 'http://localhost:9000/product/all';
    const result = await axiosGet({ url });
    dispatch(setProductList({ result }));
}

export const getProductDetail = (pid) => async (dispatch) => {
    const url = 'http://localhost:9000/product/detail';
    const data = { "pid": pid };

    const result = await axiosPost({ url, data });
    const imgList = result.imgList;
    const detailImgList = result.detailImgList; 
    dispatch(setProduct({result}));
    dispatch(setImgList({imgList}));
    dispatch(setDetailImgList({detailImgList}));
}

export const changeSize = (value) => (dispatch) => {
    dispatch(setSize({value}));
}