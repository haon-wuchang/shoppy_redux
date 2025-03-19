import {setProductList} from '../features/product/productSlice.js';
import {  axiosGet } from './api.js';

export const getProductList = () => async(dispatch) => {
    const url = 'http://localhost:9000/product/all';
    const result = await axiosGet({url});
    dispatch(setProductList({result}));
}

