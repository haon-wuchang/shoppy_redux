// axios db 연동을 위한 공통 api
import axios from "axios";

// post method
export async function axiosPost({url, data}) {
    let result = null;
// console.log('url',url);
// console.log('data',data);

    try {
        result = await axios({
            method : 'post',
            url : url,
            data : data
        }). then(res => res.data);
    } catch (error) {
        console.log(error);        
    }
    return result;
}
