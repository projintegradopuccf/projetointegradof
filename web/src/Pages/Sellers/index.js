import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { FaUsers, FaBoxes, FaMoneyBillWave } from "react-icons/fa";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "Seller ID",
    dataIndex: "seller_id",
    key: "seller_id"
  },
  {
    title: "Seller Zip code prefix",
    dataIndex: "seller_zip_code_prefix",
    key: "seller_zip_code_prefix"
  },
  {
    title: "Seller City",
    dataIndex: "seller_city",
    key: "seller_city"
  }
  ,
  {
    title: "Seller State",
    dataIndex: "seller_state",
    key: "seller_state"
  }
];

export default class Sellers extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/sellers?limit=100").then(res => {
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
              <h1 className="title"> <FaMoneyBillWave style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Sellers</h1>
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
