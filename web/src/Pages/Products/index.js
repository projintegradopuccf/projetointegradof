import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "Categoria",
    dataIndex: "product_category_name",
    key: "product_category_name "
  },
  {
    title: "Name Length",
    dataIndex: "product_name_lenght",
    key: "aproduct_name_lenght"
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
    await axios.get(api.path + "/products?limit=10000").then(res => {
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
              <h1>Produtos</h1>
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
