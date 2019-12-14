let user = {
    nUserID: 1,
    cFirstName: 'John',
    cSurname: 'Doe',
    cAddress: 'Rentemestervej 1',
    cZipCode: '2400',
    nCityID: 1,
    cPhoneNumber: '88331212',
    cEmail: 'a@a.dk',
    nTotalSpent: 0
}

function getUser() {
    return user
}

function setUser(newUser) {
    user = newUser
    console.log("NEW USER:")
    console.log(user)
}

const tax = 25.00

function getTax() {
    return tax
}


export { getUser, setUser, getTax }