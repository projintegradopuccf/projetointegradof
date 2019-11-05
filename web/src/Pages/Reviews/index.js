import React, { Component } from "react";
import { Col, Row, Table } from "antd";
import axios from "axios";
import { MdSpeakerNotes } from "react-icons/md";

import Menu from "../../Components/Menu";
import "./styles.css";
import { api } from "../../utils/api";

const columns = [
  {
    title: "Review ID",
    dataIndex: "review_id",
    key: "review_id"
  },
  {
    title: "Order ID",
    dataIndex: "order_id",
    key: "order_id"
  },
  {
    title: "Score",
    dataIndex: "review_score",
    key: "review_score"
  },
  {
    title: "Title",
    dataIndex: "review_comment_title",
    key: "review_comment_title"
  },
  {
    title: "Message",
    dataIndex: "review_comment_message",
    key: "review_comment_message"
  }
];

export default class Reviews extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      data: []
    };
  }

  async componentDidMount() {
    await axios.get(api.path + "/reviews?limit=100").then(res => {
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
              <h1 className="title"> <MdSpeakerNotes style={{
                fontSize: '30px',
                marginRight: '10px'
              }} />Reviews</h1>
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
