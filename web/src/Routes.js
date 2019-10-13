import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import Login from "./Pages/Login";
// import { Container } from './styles';
import DashboardRouter from "./DashboardRouter";

export default function Routes() {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/" component={Login} exact />
        <Route path="/dashboard">
          <DashboardRouter />
        </Route>
      </Switch>
    </BrowserRouter>
  );
}
