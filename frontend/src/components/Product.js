import React from 'react';
import { getUser } from "../services/session"
import { postRating } from "../services/postService";

class Product extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            ratingSelected: false,
            score: 0,
            comment: null
        }
    }

    onCommentChange = (e) => {
        let comment = e.target.value
        if (comment === "") {
            comment = null
        }
        this.setState({
            comment
        })
    }

    onRate = (nProductID, rating) => {
        console.log(nProductID, rating)
        this.setState({
            ratingSelected: true,
            score: rating
        })
    }
    
    onCancel = () => {
        this.setState({
            ratingSelected: false,
            score: 0
        })
    }

    onSubmit = () => {
        let rating = {
            nUserID : getUser().nUserID,
            nProductID : this.props.product.nProductID,
            nScore : this.state.score,
            cComment : this.state.comment,
        }
        postRating(rating, (success, response) => {
            if (success) {
                console.log(response.data)
            } else {
                console.log("Something went wrong")
            }
        })
    }


    render() {
        const { product, index } = this.props
        return (
            <li className="productListItem" id={`productRow${index}`} key={`productRow${index}`}>
                <div className="container">
                    <div className="row">
                        <div className="col">
                            <p className="productParagraph productName" id="textField">{product.cName}</p>
                            <p className="productParagraph descriptionWrap" id="textField">{product.cDescription}</p>
                            <p className="productParagraph descriptionWrap" id="textField">DKK {product.nUnitPrice}</p>
                            <p className="productParagraph descriptionWrap" id="textField">Stock: {product.nStock}</p>
                            <p className="productParagraph descriptionWrap" id="textField">Rating: {product.nAverageRating}</p>
                            <div>
                                <p>Rate {this.state.ratingSelected ? '(' + this.state.score + ')' : ""}: </p>
                                <button className="btn btn-outline-success my-2 my-sm-0" type="button"
                                    onClick={() => this.onRate(product.nProductID, 1)}>1</button>
                                <button className="btn btn-outline-success my-2 my-sm-0" type="button"
                                    onClick={() => this.onRate(product.nProductID, 2)}>2</button>
                                <button className="btn btn-outline-success my-2 my-sm-0" type="button"
                                    onClick={() => this.onRate(product.nProductID, 3)}>3</button>
                                <button className="btn btn-outline-success my-2 my-sm-0" type="button"
                                    onClick={() => this.onRate(product.nProductID, 4)}>4</button>
                                <button className="btn btn-outline-success my-2 my-sm-0" type="button"
                                    onClick={() => this.onRate(product.nProductID, 5)}>5</button>
                            </div>
                            {
                                this.state.ratingSelected ?
                                    <React.Fragment>
                                        <p></p>
                                        <p>Comment:</p>
                                        <textarea className="fullWidth" onChange={(e) => this.onCommentChange(e)}>
                                        </textarea>
                                        <div>
                                            <button className="btn btn-outline-success my-2 my-sm-0" onClick={this.onSubmit}>Submit</button>
                                            <button className="btn btn-outline-success my-2 my-sm-0" onClick={this.onCancel}>Cancel</button>
                                        </div>
                                    </React.Fragment>
                                    :
                                    ""
                            }
                            <p></p>
                            <p></p>
                            <button className="btn btn-outline-success my-2 my-sm-0" type="button" onClick={() => this.props.onAddToCart(product)}>Add to cart</button>
                            <p></p>
                        </div>
                    </div>
                </div>
            </li>
        )
    }
}

export default Product;