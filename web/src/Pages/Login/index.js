import React, { Component } from "react";
import axios from "axios";
// import { Container } from './styles';
import { Form, Icon, Input, Button, Row, Col, Spin } from "antd";
import "./styles.css";
import { api } from "../../utils/api";
import img from "../../assets/Vector.png";
import { withRouter } from "react-router-dom";
import PropTypes from "prop-types";

class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      isLoading: false,
      errMsg: ""
    };
  }

  handleSubmit = async e => {
    e.preventDefault();
    this.setState({
      isLoading: true
    });
    const { email, password } = this.state;
    try {
      const res = await axios.post(api.path + "/signin", { email, password });
      this.setState({
        isLoading: false,
        errMsg: ""
      });
      localStorage.removeItem('user');
      localStorage.setItem('user',JSON.stringify({email,password}));
      this.props.history.push("/dashboard/products");
    } catch (error) {
      console.log(error.response);
      this.setState({
        isLoading: false,
        errMsg: error.response.data.message
      });
    }
  };

  render() {
    const {isLoading} = this.state;
    return (
      <>
        <Row type="flex" justify="center">
          <Col span={24} style={{ textAlign: "center", padding: 20 }}>
            <img src={img} />
          </Col>
        </Row>
        <Row type="flex" justify="center">
          <Col span={6} style={{ textAlign: "center" }}>
            <h1 style={{ fontSize: "60px" }}>LOGIN</h1>
          </Col>
        </Row>
        <Row type="flex" justify="center">
          <Col span={6}>
            <Form onSubmit={this.handleSubmit} className="login-form">
              <Form.Item>
                <Input
                  prefix={
                    <Icon type="user" style={{ color: "rgba(0,0,0,.25)" }} />
                  }
                  placeholder="Username"
                  value={this.state.email}
                  onChange={e => this.setState({ email: e.target.value })}
                />
              </Form.Item>
              <Form.Item>
                <Input
                  prefix={
                    <Icon type="lock" style={{ color: "rgba(0,0,0,.25)" }} />
                  }
                  type="password"
                  placeholder="Password"
                  value={this.state.password}
                  onChange={e => this.setState({ password: e.target.value })}
                />
              </Form.Item>
              <Form.Item>
                <a className="login-form-forgot" href="">
                  Forgot password
                </a>
                <Button
                  type="primary"
                  htmlType="submit"
                  className="login-form-button"
                >
                  {!isLoading ? `Log in` : (
                    <div>
                    <Spin size="default"/>
                    </div>
                  )}
                </Button>
                Or <a onClick={() => this.props.history.push("/registro")}>register now!</a>
              </Form.Item>
              <p className="error-message">{this.state.errMsg}</p>
            </Form>
          </Col>
        </Row>
      </>
    );
  }
}

Login.propTypes = {
  history: PropTypes.shape({
    push: PropTypes.func.isRequired
  }),
  to: PropTypes.string.isRequired
};

export default withRouter(Login);
