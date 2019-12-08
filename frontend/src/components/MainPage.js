import React from 'react';
import axios from "axios";
import { getAllZipCodes, getCityNameByZipCode } from "../services/postService";

class MainPage extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            products: [{ id: 0 }, { id: 1 }, { id: 2 }],
            greeting: "",
            zipCodes: [],
            cityName: null
        }
    }

    pingNode = () => {
        axios({
            method: 'post',
            url: 'http://localhost:3500',
            data: {
                h: 'heh',
                b: 'bleh'
            }
        }).then(response => {
            console.log(response.data)
        })
            .catch(error => {
                console.log("Error: " + error);
            });
    }

    insertGreeting = () => {
        axios({
            method: 'post',
            url: 'http://localhost:3500/greeting',
            data: {
                greeting: this.state.greeting
            }
        }).then(response => {
            console.log(response.statusText)
        })
            .catch(error => {
                console.log("Error: " + error);
            });
    }

    changeGreeting = (e) => {
        let greeting = e.target.value
        this.setState({
            greeting
        })
    }

    onZipCodeChange = (e) => {
        let code = e.target.value
        if (code.length === 4) {
            getCityNameByZipCode(code, (success, response) => {
                if (success) {
                    console.log(response.data)
                    this.setState({
                        cityName: response.data[0].cCityName
                    })
                } else {
                    console.log("No such code")
                }
            })
        } else {
            this.setState({
                cityName: null
            })
        }
    }

    getZipCodes = () => {
        getAllZipCodes((success, response) => {
            if (success) {
                this.setState({
                    zipCodes: response.data
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
                        <input className="form-control mr-sm-2" type="text" placeholder="ZipCode" aria-label="Search" onChange={(e) => this.onZipCodeChange(e)} />
                        <label className="my-2 my-sm-0">
                            {
                                this.state.cityName ?
                                    this.state.cityName
                                    :
                                    "No such code"
                            }
                        </label>
                    </form>
                    <form className="form-inline my-2 my-lg-0">
                        <input className="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" onChange={(e) => this.changeGreeting(e)} />
                        <button className="btn btn-outline-success my-2 my-sm-0" type="button">Search</button>
                    </form>
                    <ul id="unList" className="list-unstyled">
                        {
                            this.state.products.map((product, index) => (
                                <li className="productListItem" id={`productRow${index}`} key={`productRow${index}`}>
                                    <div className="container">
                                        <div className="row">
                                            <div className="col">
                                                <p className="productParagraph" id="textField">{product.id}</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            ))
                        }
                        <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={this.getZipCodes}>Java</button>
                    </ul>
                </div>
            </div>
        )
    }
}

export default MainPage;