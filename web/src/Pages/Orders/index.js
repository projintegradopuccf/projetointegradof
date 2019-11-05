import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { MdReorder } from "react-icons/md";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "Order ID",
    dataIndex: "order_id",
    key: "order_id"
  },
  {
    title: "Customer ID",
    dataIndex: "customer_id",
    key: "customer_id"
  },
  {
    title: "Order Status",
    dataIndex: "order_status",
    key: "order_status"
  },
  {
    title: "Order Purchase Time",
    dataIndex: "order_purchase_timestamp",
    key: "order_purchase_timestamp"
  }
  ,
  {
    title: "Order Approved Time",
    dataIndex: "order_approved_at",
    key: "order_approved_at"
  }
];

export default class Orders extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/orders?limit=100").then(res => {
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
              <h1 className="title"> <MdReorder style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Orders</h1>
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
