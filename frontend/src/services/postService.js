import axios from "axios";
const BASE_URL = 'http://localhost:3500'

export { postProductBySearch };

function postProductBySearch(name, description, callback) {
    axios({
        method: 'post',
        url: `${BASE_URL}/productSearch/`,
        data: {
            name,
            description
        }
    }).then(response => {
        return callback(true, response);
    })
    .catch(error => {
        console.log("Error: " + error);
        return callback(false, error);
    });
}