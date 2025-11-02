##Project Objective

To analyze workforce data and uncover key insights related to employee attrition, compensation, job satisfaction, and demographics — helping HR leaders identify factors driving attrition and design data-backed retention strategies.


##Data Model Overview

The project is built using four main tables:

Employees — Employee demographics (Age, Gender, Marital Status, Education Field)

Jobs — Job-level details (Role, Department, Job Satisfaction, Environment Satisfaction, Years at Company)

Compensation — Salary, Stock Options, Overtime, Percent Hike

Attrition — Attrition flag, Years since Promotion, Training, and Manager Tenure

Each table is connected via a common Employee Number key ensuring consistent, filterable insights.

##Dashboard Pages

#Page 1: Executive Summary

High-level overview for HR executives to understand the organization’s workforce composition and attrition trends.

KPIs: Total Employees, Attrition Count, Attrition Rate %, Average Age, Average Monthly Income, Average Years at Company

Visuals:

Attrition Rate by Department

Attrition by Job Role

Attrition by Gender & Marital Status

Attrition by Age Band

Average Monthly Income vs Job Level

Slicers: Department | Gender | Job Role


#Page 2: Compensation & Performance Insights

Focuses on identifying whether pay, promotions, or overtime affect attrition rates.

Attrition Rate by Salary Range

Attrition by Stock Option Level

Years Since Last Promotion vs Attrition

Avg Monthly Income vs Job Satisfaction

Overtime vs Attrition

Includes contextual insight box:

“This page explores compensation and growth factors influencing attrition.”


##Key Business Insights

Total Employees: 1470, with 16.12% attrition rate (237 employees).

Sales Department shows the highest attrition (20.63%), especially among Sales Representatives (39.76%).

Single male employees (age 18–21) show a higher tendency to leave — possibly seeking promotions or salary growth.

HR Department reports high attrition in divorced females (~75%).

Junior positions (Sales Rep, Lab Tech) show more turnover than senior ones.

Attrition is higher for employees with Overtime and Stock Option Levels 0 & 3.

Employees earning below $2,000/month show greater attrition risk — suggesting need for salary revision or retention perks.


##Tools & Technologies

Power BI (Data Modeling, DAX, Interactive Visuals)

MS Excel / CSV (Data Cleaning & Transformation)

DAX Measures for KPIs such as Attrition Rate %, Average Income, etc.


##Learnings & Highlights

Built an interactive, multi-page HR dashboard with professional color theming and synced filters.

Created calculated measures to track HR KPIs and detect high-risk attrition segments.

Demonstrated data storytelling through structured insights and HR domain relevance.
