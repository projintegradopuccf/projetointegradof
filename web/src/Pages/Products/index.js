import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { FaUsers, FaBoxes, FaMoneyBillWave } from "react-icons/fa";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";
import MongoChart from '../../Components/MongoChart'
import { chartsUrl } from '../../utils/charts';

const columns = [
  {
    title: "ID",
    dataIndex: "product_id",
    key: "product_id"
  },
  {
    title: "Categoria",
    dataIndex: "product_category_name",
    key: "product_category_name "
  },
  {
    title: "Name Length",
    dataIndex: "product_name_lenght",
    key: "product_name_lenght"
  },
  {
    title: "Weight",
    dataIndex: "product_weight_g",
    key: "product_weight_g"
  }
];

export default class Products extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/products?limit=100").then(res => {
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
            }}
          >
            <Col span={20}>
              <h1 className="title"> <FaBoxes style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Products</h1>
            </Col>
            <Col span={20}
              style={{
                display: "flex",
                justifyContent: "center",
                marginBottom: 20
              }}>
              <MongoChart url={chartsUrl.productsCategoryCount} />
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
