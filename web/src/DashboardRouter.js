import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import Products from "./Pages/Products";

export default class DashboardRouter extends React.Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route path="/dashboard/products" component={Products} exact />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}
