import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { MdLocationOn } from "react-icons/md";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "ID",
    dataIndex: "_id",
    key: "_id"
  },
  {
    title: "Zip code prefix",
    dataIndex: "geolocation_zip_code_prefix",
    key: "geolocation_zip_code_prefix"
  },
  {
    title: "Latitude",
    dataIndex: "geolocation_lat",
    key: "geolocation_lat"
  },
  {
    title: "Longitude",
    dataIndex: "geolocation_lng",
    key: "geolocation_lng"
  }
  ,
  {
    title: "City",
    dataIndex: "geolocation_city",
    key: "geolocation_city"
  }
  ,
  {
    title: "State",
    dataIndex: "geolocation_state",
    key: "geolocation_state"
  }
];

export default class Geolocations extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/geolocations?limit=100").then(res => {
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
              <h1 className="title"> <MdLocationOn style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Geolocations</h1>
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
