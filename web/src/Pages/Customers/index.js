import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "ID",
    dataIndex: "customer_id",
    key: "customer_id"
  },
  {
    title: "Zipcode prefix",
    dataIndex: "customer_zip_code_prefix",
    key: "customer_zip_code_prefix "
  },
  {
    title: "City",
    dataIndex: "customer_city",
    key: "customer_city"
  },
  {
    title: "State",
    dataIndex: "customer_state",
    key: "customer_state"
  }
];

export default class Customers extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/customers?limit=100").then(res => {
      console.log(`res`, res);
      this.setState({
        isLoading: false,
        data: res.data
      });
    });
  }
  render() {
    return (
      <Row>
        <Col span={4}>
          <Menu />
        </Col>
        <Col span={20}>
          <Row
            type="flex"
            justify="center"
            align="middle"
            style={{
              display: "flex",
              justifyContent: "center",
              marginTop: 20
            }}
          >
            <Col span={20}>
              <h1>Customers Data</h1>
            </Col>
            <Col span={20}>
              {this.state.isLoading ? (
                <p>Carregando...</p>
              ) : (
                <Table dataSource={this.state.data} columns={columns} />
              )}
            </Col>
          </Row>
        </Col>
      </Row>
    );
  }
}
