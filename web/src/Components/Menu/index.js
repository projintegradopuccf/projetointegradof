import React from "react";
import { Menu, Icon } from "antd";
import { Link } from "react-router-dom";
import { FaUsers, FaBoxes, FaMoneyBillWave } from "react-icons/fa";
import { MdLocationOn, MdReorder, MdPayment, MdSpeakerNotes } from 'react-icons/md'
import { GoListUnordered } from 'react-icons/go'

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
            <FaUsers style={{
              fontSize: '24px',
              position: 'relative',
              top: '7px',
              marginRight: '7px'
            }} />
            <span>Customers</span>
          </Link>
        </Menu.Item>
        <Menu.Item key="2">
          <MdLocationOn style={{
            fontSize: '24px',
            position: 'relative',
            top: '7px',
            marginRight: '7px'
          }} />
          <span>Geolocation</span>
        </Menu.Item>
        <Menu.Item key="3">
          <GoListUnordered style={{
            fontSize: '24px',
            position: 'relative',
            top: '7px',
            marginRight: '7px'
          }} />
          <span>Order items</span>
        </Menu.Item>
        <Menu.Item key="4">
          <MdReorder style={{
            fontSize: '24px',
            position: 'relative',
            top: '7px',
            marginRight: '7px'
          }} />
          <span>Orders</span>
        </Menu.Item>
        <Menu.Item key="5">
          <MdPayment style={{
              fontSize: '24px',
              position: 'relative',
              top: '7px',
              marginRight: '7px'
            }} />
          <span>Payments</span>
        </Menu.Item>
        <Menu.Item key="6">
          <MdSpeakerNotes style={{
              fontSize: '24px',
              position: 'relative',
              top: '7px',
              marginRight: '7px'
            }}/>
          <span>Reviews</span>
        </Menu.Item>
        <Menu.Item key="7">
          <Link to="/dashboard/products">
            <FaBoxes style={{
              fontSize: '24px',
              position: 'relative',
              top: '7px',
              marginRight: '7px'
            }} />
            <span>Products</span>
          </Link>
        </Menu.Item>
        <Menu.Item key="8">
          <FaMoneyBillWave style={{
              fontSize: '24px',
              position: 'relative',
              top: '7px',
              marginRight: '7px'
            }} />
          <span>Sellers</span>
        </Menu.Item>
      </Menu>
    </div>
  );
}
