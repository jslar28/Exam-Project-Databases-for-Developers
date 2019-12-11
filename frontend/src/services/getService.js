import axios from "axios";
const BASE_URL = 'http://localhost:3500'

function getCreditCardsByUser(userID, callback) {
    axios({
        method: 'get',
        url: `${BASE_URL}/creditCards/${userID}`
    }).then(response => {
        return callback(true, response);
    })
    .catch(error => {
        return callback(false, error);
    });
}

export { getCreditCardsByUser };