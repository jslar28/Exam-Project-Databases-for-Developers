let user = {
    nUserID: 4,
    cFirstName: 'John',
    cSurname: 'Doe',
    cAddress: null,
    cZipCode: '2860',
    nCityID: 1,
    cPhoneNumber: '11223344',
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

export { getUser, setUser }