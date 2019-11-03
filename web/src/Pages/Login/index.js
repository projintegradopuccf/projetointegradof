import React, { Component } from "react";
import axios from "axios";
import { withRouter } from "react-router-dom";
import PropTypes from "prop-types";
import { Form, Icon, Input, Button, Checkbox } from "antd";
import "./styles.css";
import { api } from "../../utils/api";

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
    return (
      <div className="container-login">
        <Form onSubmit={this.handleSubmit} className="login-form">
          <Form.Item>
            <Input
              prefix={<Icon type="user" style={{ color: "rgba(0,0,0,.25)" }} />}
              placeholder="Username"
              value={this.state.email}
              onChange={e => this.setState({ email: e.target.value })}
            />
          </Form.Item>
          <Form.Item>
            <Input
              prefix={<Icon type="lock" style={{ color: "rgba(0,0,0,.25)" }} />}
              type="password"
              placeholder="Password"
              value={this.state.password}
              onChange={e => this.setState({ password: e.target.value })}
            />
          </Form.Item>
          <Form.Item>
            <a className="login-form-forgot">Forgot password</a>
            <Button
              type="primary"
              htmlType="submit"
              className="login-form-button"
            >
              Log in
            </Button>
            Or <a>register now!</a>
          </Form.Item>
          <p className="error-message">{this.state.errMsg}</p>
        </Form>
      </div>
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
