import React from 'react';
import { postProductBySearch, postPurchase } from "../services/postService";
import { getCreditCardsByUser } from "../services/getService";
import { getUser, getTax } from "../services/session"
import Product from './Product';

class MainPage extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            products: [],
            zipCodes: [],
            creditCards: [],
            cityName: null,
            nameSearch: "",
            descriptionSearch: "",
            selectedID: null,
            cart: []
        }
    }

    componentDidMount() {
        getCreditCardsByUser(getUser().nUserID, (success, response) => {
            if (success && response.data.length > 0) {
                console.log(response.data)
                this.setState({
                    selectedID: response.data[0].nCreditCardID,
                    creditCards: response.data
                })
            } else {
                console.log("No credit cards found")
                this.setState({
                    creditCards: []
                })
            }
        })
    }

    onBuy = () => {
        console.log("BUY")
        let totalAmount = 0;
        for (let i = 0; i < this.state.cart.length; i++) {
            const product = this.state.cart[i];
            totalAmount += product.combinedPrice            
        }
        let purchase = {
            tax: getTax(),
            totalAmount,
            creditCardID: this.state.selectedID,
            userID: getUser().nUserID,
            cart: this.state.cart
        }
        
        postPurchase(purchase, (success, response) => {
            if (success) {
                console.log("Purcase went through!")
                console.log(response)
            } else {
                console.log("Purchase didn't go through")
                console.log(response)
            }
        })
        
    }

    onRemoveCartItem = (nProductID) => {
        this.state.cart.forEach((product, index) => {
            if (product.nProductID === nProductID) {
                let newCart = [...this.state.cart]
                let currentQuantity = product.quantity
                if (currentQuantity === 1) {
                    newCart.splice(index, 1)
                } else {
                    newCart[index].quantity -= 1
                    newCart[index].combinedPrice = product.unitPrice * product.quantity
                }
                this.setState({
                    cart: newCart
                })
            }
        })
    }

    onAddToCart = (selectedProduct) => {
        let trimmedProduct = {
            nProductID: selectedProduct.nProductID,
            name: selectedProduct.cName,
            unitPrice: selectedProduct.nUnitPrice,
            combinedPrice: selectedProduct.nUnitPrice,
            quantity: 1
        }

        if (this.state.cart.length > 0) {
            let foundIndex = null

            for (let i = 0; i < this.state.cart.length; i++) {
                const product = this.state.cart[i];
                if (product.nProductID === selectedProduct.nProductID) {
                    foundIndex = i;
                    break;
                }
            }

            if (foundIndex != null) {
                let product = this.state.cart[foundIndex]
                let newCart = [...this.state.cart]
                newCart[foundIndex].quantity += 1
                newCart[foundIndex].combinedPrice = product.unitPrice * product.quantity
                this.setState({
                    cart: newCart
                })
            } else {
                this.setState(prevState => ({
                    cart: [...prevState.cart, trimmedProduct]
                }))
            }
        } else {
            this.setState({
                cart: [trimmedProduct]
            })
        }

    }

    onSelectionClick = (e) => {
        let selection = e;
        this.setState({
            selectedID: selection
        })
    }

    onInputChange = (e) => {
        let attribute = e.target.id
        this.setState({
            [attribute]: e.target.value
        }, () => console.log(this.state))
    }

    onNameSearchChange = (e) => {
        let search = e.target.value
        if (search.length > 0) {
            this.setState({
                nameSearch: search
            })
        } else {
            this.setState({
                nameSearch: ""
            })
        }
    }

    onDescriptionSearchChange = (e) => {
        let search = e.target.value
        if (search.length > 0) {
            this.setState({
                descriptionSearch: search
            })
        } else {
            this.setState({
                descriptionSearch: ""
            })
        }
    }

    onSearchProduct = () => {
        postProductBySearch(this.state.nameSearch, this.state.descriptionSearch, (success, response) => {
            if (success && response.data.length > 0) {
                console.log(response.data)
                this.setState({
                    products: response.data
                })
            } else {
                console.log("No product found")
                console.log(response)
                this.setState({
                    products: []
                })
            }
        })
    }

    render() {
        return (
            <div className="container topSpacer">
                <div className="row">
                    <div className="col-sm-6">
                        <div className="container mainContainer">
                            <form className="form-inline my-2 my-lg-0">
                                <input className="form-control mr-sm-2" type="text" placeholder="Name" id="nameSearch" onChange={(e) => this.onInputChange(e)} />
                                <input className="form-control mr-sm-2" type="text" placeholder="Description" id="descriptionSearch" onChange={(e) => this.onInputChange(e)} />
                                <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={this.onSearchProduct}>Search</button>
                            </form>
                        </div>
                        <div className="mainContainer">
                            <ul id="unList" className="list-unstyled">
                                {
                                    this.state.products.map((product, index) => (
                                        <Product
                                            key={index}
                                            index={index}
                                            product={product}
                                            onAddToCart={this.onAddToCart}
                                        />
                                    ))
                                }
                            </ul>
                        </div>
                    </div>
                    <div className="col-sm-6">
                        <div className="container mainContainer">
                            <div className="container">
                                <label className="productName">Cart</label>
                                <div className="row">
                                    <div className="col">
                                        {
                                            this.state.cart.length > 0 ?
                                                <React.Fragment>
                                                    <ul id="unList" className="list-unstyled">
                                                        {
                                                            this.state.cart.map((product, index) => (
                                                                <li className="productListItem" id={`productRow${index}`} key={`productRow${index}`}>
                                                                    <div className="container">
                                                                        <div className="row">
                                                                            <div className="col">
                                                                                <p className="productParagraph productName" id="textField">{product.name}</p>
                                                                                <p className="productParagraph descriptionWrap" id="textField">DKK {product.combinedPrice} ({product.unitPrice}/piece)</p>
                                                                                <p className="productParagraph descriptionWrap" id="textField">Quantity: {product.quantity}</p>
                                                                                <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={() => this.onAddToCart(product)}>+</button>
                                                                                <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={() => this.onRemoveCartItem(product.nProductID)}>-</button>
                                                                                <p></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            ))
                                                        }
                                                    </ul>
                                                    <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={() => this.onBuy()}>BUY</button>
                                                </React.Fragment>
                                                :
                                                ""
                                        }
                                    </div>
                                </div>
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="container mainContainer">
                                <div className="container">
                                    <label className="productName">User</label>
                                    <div className="row">
                                        <div className="col">
                                            <p className="productParagraph" id="textField">{getUser().cFirstName}</p>
                                            <p className="productParagraph" id="textField">{getUser().cSurname}</p>
                                            <p className="productParagraph" id="textField">{getUser().cEmail}</p>
                                        </div>
                                        <div className="col">
                                            <p className="productParagraph" id="textField">Address: {getUser().cAdress}</p>
                                            <p className="productParagraph" id="textField">{getUser().cZipCode}</p>
                                            <p className="productParagraph" id="textField">City ID: {getUser().nCityID}</p>
                                            <p className="productParagraph" id="textField">Total Spent: {getUser().nTotalSpent}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p></p>
                        </div>
                        <div className="container mainContainer">
                            <div className="container">
                                <label className="productName">Credit cards</label>
                                {
                                    this.state.creditCards.length > 0 ?
                                        <ul id="unList" className="list-unstyled">
                                            {
                                                this.state.creditCards.map((creditCard, index) => (
                                                    <li className="productListItem" id={`creditCardRow${index}`} key={`creditCardRow${index}`}>
                                                        <div className="container">
                                                            <div className="row">
                                                                <div className="col">
                                                                    {
                                                                        this.state.selectedID === creditCard.nCreditCardID ?
                                                                            <p className="productParagraph productName green" id="textField">Selected</p>
                                                                            :
                                                                            <p className="productParagraph productName red" id="textField" onClick={() => this.onSelectionClick(creditCard.nCreditCardID)}>Not selected</p>
                                                                    }
                                                                    <p className="productParagraph productName" id="textField">Card number: {creditCard.cCardNumber}</p>
                                                                    <p className="productParagraph descriptionWrap" id="textField">IBAN ID: {creditCard.nIBANID}</p>
                                                                    <p className="productParagraph descriptionWrap" id="textField">Cardholder ID: {creditCard.nCardHolderID}</p>
                                                                    <p className="productParagraph descriptionWrap" id="textField">Expires: {creditCard.cExpiryDate}</p>
                                                                    <p className="productParagraph descriptionWrap" id="textField">CCV: {creditCard.cCCV}</p>
                                                                    <p className="productParagraph descriptionWrap" id="textField">DKK Spent: {creditCard.nTotalAmountSpent}</p>
                                                                    <p></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                ))
                                            }
                                        </ul>
                                        :
                                        ""
                                }
                            </div>
                        </div >
                    </div>
                </div>
            </div>
        )
    }
}

export default MainPage;