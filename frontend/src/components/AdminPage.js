import React from 'react';
//import axios from "axios";

class AdminPage extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            productName: "",
            productDescription: "",
        }
    }

    onInputChange = (e) => {
        let attribute = e.target.id
        this.setState({
            [attribute]: e.target.value
        }, () => console.log(this.state))
    }

    render() {
        return (
            <div className="w-75 p-3 center">
                <div className="container mainContainer">
                    <form className="form-inline my-2 my-lg-0">
                        <input className="form-control mr-sm-2" type="text" placeholder="Name" id="productName" onChange={(e) => this.onInputChange(e)} />
                        <input className="form-control mr-sm-2" type="text" placeholder="Description" id="productDescription" onChange={(e) => this.onInputChange(e)} />
                        <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={this.onSearchProduct}>Search</button>
                    </form>
                </div>
            </div>
        )
    }
}

export default AdminPage;