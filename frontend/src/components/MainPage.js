import React from 'react';
import { postProductBySearch } from "../services/postService";
import { getUser } from "../services/session"

class MainPage extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            products: [],
            zipCodes: [],
            cityName: null,
            nameSearch: "",
            descriptionSearch: ""
        }
    }

    componentDidMount() {
        let x = getUser()
        console.log(x)
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
            if (success) {
                console.log(response.data)
                this.setState({
                    products: response.data
                })
            } else {
                console.log("No product found")
                this.setState({
                    products: []
                })
            }
        })
    }

    render() {
        return (
            <div className="w-75 p-3 center">

                <div className="container" id="navbarSupportedContent">
                    <div className="row">
                        <div className="col">
                            <a className="nav-link" href="#1">Homes <span className="sr-only">(current)</span></a>
                        </div>
                        <div className="col">
                            <a className="nav-link" href="#1">Home <span className="sr-only">(current)</span></a>
                        </div>
                        <div className="col">
                            <a className="nav-link" href="#1">Home <span className="sr-only">(current)</span></a>
                        </div>
                    </div>
                </div>
                <div className="container mainContainer">
                    <form className="form-inline my-2 my-lg-0">
                        <input className="form-control mr-sm-2" type="text" placeholder="Name" id="nameSearch" onChange={(e) => this.onInputChange(e)} />
                        <input className="form-control mr-sm-2" type="text" placeholder="Description" id="descriptionSearch" onChange={(e) => this.onInputChange(e)} />
                        <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={this.onSearchProduct}>Search</button>
                    </form>
                    <ul id="unList" className="list-unstyled">
                        {
                            this.state.products.map((product, index) => (
                                <li className="productListItem" id={`productRow${index}`} key={`productRow${index}`}>
                                    <div className="container">
                                        <div className="row">
                                            <div className="col">
                                                <p className="productParagraph productName" id="textField">{product.cName}</p>
                                                <p className="productParagraph descriptionWrap" id="textField">{product.cDescription}</p>
                                                <p className="productParagraph descriptionWrap" id="textField">DKK {product.nUnitPrice}</p>
                                                <p className="productParagraph descriptionWrap" id="textField">Stock: {product.nStock}</p>
                                                <p className="productParagraph descriptionWrap" id="textField">Rating: {product.nAverageRating}</p>
                                                <button className="btn btn-outline-success my-2 my-sm-0" type="button">TODO: Add to cart</button>
                                                <p></p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            ))
                        }
                        <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={this.getZipCodes}>PH</button>
                    </ul>
                </div>
                <div>
                    <p></p>
                </div>
                <div className="container mainContainer">
                    <div className="container">
                        <label>User</label>
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
            </div>
        )
    }
}

export default MainPage;