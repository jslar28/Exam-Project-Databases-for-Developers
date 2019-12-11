import axios from "axios";
const BASE_URL = 'http://localhost:3500'

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
        return callback(false, error);
    });
}

function postUserByEmail(email, callback) {
    axios({
        method: 'post',
        url: `${BASE_URL}/login/`,
        data: {
            email
        }
    }).then(response => {
        return callback(true, response);
    })
    .catch(error => {
        return callback(false, error);
    });
}

function postRating(rating, callback) {
    axios({
        method: 'post',
        url: `${BASE_URL}/rating/`,
        data: {
            rating
        }
    }).then(response => {
        return callback(true, response);
    })
    .catch(error => {
        return callback(false, error);
    });
}


export { postProductBySearch, postUserByEmail, postRating };