import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { FaUsers, FaBoxes, FaMoneyBillWave } from "react-icons/fa";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "ID",
    dataIndex: "order_id",
    key: "order_id"
  },
  {
    title: "Price",
    dataIndex: "price",
    key: "price"
  },
  {
    title: "Freight Value",
    dataIndex: "freight_value",
    key: "freight_value"
  },
  {
    title: "Shipping limit date",
    dataIndex: "shipping_limit_date",
    key: "shipping_limit_date"
  }
];

export default class OrderItens extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/order-itens?limit=100").then(res => {
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
              <h1 className="title"> <FaUsers style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Order Itens</h1>
            </Col>
            <Col span={20}>
              {this.state.isLoading ? (
                <p>Carregando...</p>
              ) : (
                  <Table dataSource={this.state.data} columns={columns} style={{
                    background: '#e6e6e6',
                  }} />
                )}
            </Col>
          </Row>
        </Col>
      </Row>
    );
  }
}
