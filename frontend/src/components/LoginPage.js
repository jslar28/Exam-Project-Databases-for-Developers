import React from 'react';
import { postUserByEmail } from "../services/postService";
import { setUser } from "../services/session"

class LoginPage extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            email: "",
            user: null,
            showError: false
        }
    }

    onInputChange = (e) => {
        let attribute = e.target.id
        this.setState({
            [attribute]: e.target.value
        }, () => console.log(this.state))
    }

    onLogin = () => {
        postUserByEmail(this.state.email, (success, res) => {
            if (success) {
                if (res.data.length === 0) {
                    this.setState({
                        showError: true
                    })
                } else {
                    this.setState({
                        user: res.data[0],
                        showError: false
                    }, () => {
                        setUser(this.state.user)
                        this.props.history.push("/main")
                    })
                }
            } else {
                console.log(res.message)
            }
        })
    }

    render() {
        return (
            <div className="w-75 p-3 center">
                <div className="container mainContainer">
                    <form className="form-inline my-2 my-lg-0">
                        <input className="form-control mr-sm-2" type="text" placeholder="Name" id="email" onChange={(e) => this.onInputChange(e)} />
                        <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={this.onLogin}>Login</button>
                    </form>
                    {
                        this.state.showError ?
                        <label>No email found</label>
                        :
                        ""
                    }
                    
                </div>
            </div>
        )
    }
}

export default LoginPage;