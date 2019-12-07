import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { MdPayment } from "react-icons/md";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

import MongoChart from '../../Components/MongoChart'
import {chartsUrl} from '../../utils/charts';

const columns = [
  {
    title: "Order ID",
    dataIndex: "order_id",
    key: "order_id"
  },
  {
    title: "Payment Type",
    dataIndex: "payment_type",
    key: "payment_type"
  },
  {
    title: "Payment Installments",
    dataIndex: "payment_installments",
    key: "payment_installments"
  },
  {
    title: "Payment Value",
    dataIndex: "payment_value",
    key: "payment_value"
  }
];

export default class Payments extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/payments?limit=100").then(res => {
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
              <h1 className="title"> <MdPayment style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Payments</h1>
            </Col>
            <Col span={20}
              style={{
                display: "flex",
                justifyContent: "center",
                marginBottom: 20
              }}>
                <MongoChart url={chartsUrl.paymentTypes}/>
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
