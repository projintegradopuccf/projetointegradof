import React from "react";
import { Menu, Icon } from "antd";
import { Link } from "react-router-dom";
export default function NavigationMenu() {
  return (
    <div
      style={{
        width: "256px",
        backgroundColor: "#001529",
        minHeight: "2000px"
      }}
    >
      <Menu mode="inline" theme="dark" inlineCollapsed={false}>
        <Menu.Item key="1">
          <Link to="/dashboard/customers">
            <Icon type="pie-chart" />
            <span>Customers</span>
          </Link>
        </Menu.Item>
        <Menu.Item key="2">
          <Icon type="pie-chart" />
          <span>Geolocation</span>
        </Menu.Item>
        <Menu.Item key="3">
          <Icon type="pie-chart" />
          <span>Order items</span>
        </Menu.Item>
        <Menu.Item key="4">
          <Icon type="pie-chart" />
          <span>Orders</span>
        </Menu.Item>
        <Menu.Item key="5">
          <Icon type="pie-chart" />
          <span>Payments</span>
        </Menu.Item>
        <Menu.Item key="6">
          <Icon type="pie-chart" />
          <span>Reviews</span>
        </Menu.Item>
        <Menu.Item key="7">
          <Link to="/dashboard/products">
            <Icon type="pie-chart" />
            <span>Products</span>
          </Link>
        </Menu.Item>
        <Menu.Item key="8">
          <Icon type="pie-chart" />
          <span>Sellers</span>
        </Menu.Item>
      </Menu>
    </div>
  );
}
