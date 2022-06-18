# Charts And APIs

## Tool

PowerBI

## Data source

Public api : https://documenter.getpostman.com/view/10808728/SzS8rjbc#b07f97ba-24f4-4ebe-ad71-97fa35f3b683


## Approach

PowerBI directly access data through api using web source. As authentication is not required for the pubic data, API can be easily configured for direct data access. In case, if we want to refresh with new data, clicking refresh button in the PBI report will get latest data through API

Dashboard has below components

1. **Main chart** - This given total number of cases each day
2. **Date selector** - Select period of dates we want to drill down and check. Start date and end date can be adjusted
3. **Total number** of cases as of latest date

