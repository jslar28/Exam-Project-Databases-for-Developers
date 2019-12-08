import axios from "axios";
const BASE_URL = 'http://localhost:3500'

export { getAllZipCodes, getCityNameByZipCode };

function getAllZipCodes(callback) {
    axios({
        method: 'get',
        url: `${BASE_URL}/zipCodes`,
    }).then(response => {
        return callback(true, response);
    })
    .catch(error => {
        console.log("Error: " + error);
        return callback(false, error);
    });
}

function getCityNameByZipCode(code, callback) {
    axios({
        method: 'get',
        url: `${BASE_URL}/zipCode/` + code,
    }).then(response => {
        return callback(true, response);
    })
    .catch(error => {
        console.log("Error: " + error);
        return callback(false, error);
    });
}