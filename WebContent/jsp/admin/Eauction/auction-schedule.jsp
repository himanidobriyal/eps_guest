<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Auction Management | IREPS Portal</title> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        * { 
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: white;
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Header Styles - Matching High Tender */
        .ireps-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #0b253f;
            padding: 40px 20px;
            color: white;
        }

        .left-section {
            display: flex;
            align-items: center;
            gap: 15px;
            height: 50px;
        }

        .left-section img {
            height: 80px;
            width: auto;
        }

        .center-section {
            text-align: center;
            flex: 1;
            transform: translateX(-70px);
        }

        .main-title {
            font-size: 30px;
            font-weight: 500;
        }

        .sub-title {
            color: #ffd700;
            font-size: 28px;
            font-weight: bold;
        }

        .right-section {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            font-size: 16px;
            color: white;
            margin-right: 20px;
            gap: 8px;
        }

        .right-section label {
            color: white;
            font-weight: 500;
            margin-right: 8px;
        }

        .language-dropdown {
            background-color: #0b253f;
            color: white;
            border: 1px solid #ccc;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 16px;
            appearance: none;
            cursor: pointer;
        }

        .lang-container {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .icon-row {
            display: flex;
            gap: 10px;
            position: relative;
            top: 40px;
        }

        .home-icon,
        .logout-icon {
            font-size: 26px;
            color: white;
            background-color: #0000B;
            padding: 4px 10px;
            border-radius: 4px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            text-decoration: none;
        }

        .menu-icon {
            font-size: 26px;
            cursor: pointer;
            margin-left: 15px;
            color: white;
        }

        /* Sidebar */
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1000;
            top: 0;
            left: 0;
            background-color: #0b253f;
            overflow-x: hidden;
            transition: 0.4s;
            padding-top: 60px;
        }

        .sidebar a {
            padding: 12px 20px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #1e3a8a;
        }

        .sidebar .closebtn {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 28px;
            color: white;
            cursor: pointer;
        }

        /* Navigation Tabs */
        .nav-container {
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
            margin-bottom: 20px;
        }

        .nav-tabs {
            display: flex;
            background: white;
            border: 1px solid #d1d5db;
            border-radius: 0;
            overflow: hidden;
            max-width: 1400px;
            margin: 0 auto;
        }

        .nav-tab {
            flex: 1;
            background: #f3f4f6;
            padding: 14px 20px;
            text-align: center;
            cursor: pointer;
            border-right: 1px solid #d1d5db;
            transition: all 0.3s ease;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
            position: relative;
            text-decoration:none;
			display:block;
        }

        .nav-tab:last-child {
            border-right: none;
        }

        .nav-tab:hover {
            background: #e5e7eb;
        }

        .nav-tab.active {
            background:linear-gradient(135deg, #1e3a8a, #2563eb);
            color: white;
            box-shadow: inset 0 -3px 0 0 #2563eb;
        }

        .nav-tab i {
            margin-right: 8px;
        }

        /* Main Content */
        .main-container {
            flex: 1;
            max-width: 100%;
            margin: 0;
            padding: 0;
            overflow-y: auto;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        /* Search Card */
        .search-card {
            margin: 10px auto;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 123, 255, 0.35);
            overflow: hidden;
            max-width: 1400px;
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .search-card-fieldset{
			
			margin: 10px auto;
			
			background: rgba(255,255,255,0.98);
			
			border-radius: 20px;
			
			padding: 25px;
			
			max-width: 1400px;
			
			width: 100%;
			
			box-shadow: 0 8px 30px rgba(0,123,255,.35);
			
			border: none;
			
			position: relative;
			
			}
			
			.search-card-fieldset legend{
			
			position: absolute;
			
			top: -12px;
			
			left: 25px;
			
			padding: 2px 10px;
			
			font-size: 18px;
			
			font-weight: 700;
			
			color: #1e3a8a;
			
			background: #f8fafc;
			
			}

        .search-header {
            background: white;
            color: #2c5aa0;
            text-align: center;
            position: relative;
            border-bottom: 2px solid #2c5aa0;
        }

        .search-header h3 {
            font-size: 20px;
            position: relative;
            z-index: 1;
            letter-spacing: 0.5px;
            margin: 0;
            color: #2c5aa0;
            padding: 10px;
        }

        .search-content {
            padding: 20px;
        }

        /* Form Styles */
        .form-grid {
            display: grid;
            grid-template-columns:  repeat(3, 1fr);
            gap: 14px;
            margin-bottom: 12px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 6px;
            font-size: 14px;
        }

        .required {
            color: #e17055;
        }

        .form-control {
            padding: 10px 14px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            background: white;
            color: #2d3436;
            min-height: 42px;
        }

        .form-control:focus {
            outline: none;
            border-color: #74b9ff;
            box-shadow: 0 0 0 3px rgba(116, 185, 255, 0.1);
        }

        select.form-control {
            appearance: none;
            cursor: pointer;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M10.293 3.293L6 7.586 1.707 3.293A1 1 0 00.293 4.707l5 5a1 1 0 001.414 0l5-5a1 1 0 10-1.414-1.414z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 12px;
            padding-right: 40px;
        }

        .date-range {
            display: grid;
            grid-template-columns: 1fr auto 1fr;
            gap: 12px;
            align-items: center;
        }

        .date-separator {
            font-weight: 600;
            color: #2d3436;
            text-align: center;
            font-size: 14px;
            background: #f8f9fa;
            padding: 7px 10px;
            border-radius: 6px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin-top: 16px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 36px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(116, 185, 255, 0.3);
        }

        .btn-secondary {
            background: transparent;
            color: #666;
            border: 2px solid #ddd;
        }

        .btn-secondary:hover {
            background: #f5f5f5;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        .btn-success {
            background: linear-gradient(45deg, #10b981, #059669);
            color: white;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(16, 185, 129, 0.3);
        }

        .btn-warning {
            background: linear-gradient(45deg, #f59e0b, #d97706);
            color: white;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(245, 158, 11, 0.3);
        }

        /* Alert Styles */
        .alert {
            padding: 14px 18px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: none;
            border-left: 4px solid;
            align-items: center;
            gap: 10px;
        }

        .alert.active {
            display: flex;
        }

        .alert-success {
            background: #ecfdf5;
            color: #065f46;
            border-left-color: #10b981;
        }

        .alert-error {
            background: #fef2f2;
            color: #991b1b;
            border-left-color: #dc2626;
        }

        .alert i {
            font-size: 18px;
        }

        /* Loading Spinner */
        .loading {
            display: none;
            text-align: center;
            padding: 40px;
            color: #1e3a8a;
        }

        .loading.active {
            display: block;
        }

        .spinner {
            border: 4px solid #e5e7eb;
            border-top: 4px solid #1e3a8a;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto 15px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Results Section */
        .results-section {
            padding: 20px;
            background: white;
            max-width: 1400px;
            margin: 15px auto 30px auto;
        }

        .results-header {
            background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%);
            color: white;
            padding: 12px 18px;
            border-radius: 12px;
            margin-bottom: 15px;
            box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .results-header h3 {
            font-size: 22px;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            letter-spacing: 0.5px;
            margin: 0;
        }

        .total-count {
            font-size: 18px;
            font-weight: 600;
        }

        /* Pagination Controls */
       .pagination-controls{
		    display:flex;
		    justify-content:space-between;
		    align-items:center;
		    gap:15px;
		    flex-wrap:wrap;
		}


        .results-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .records-per-page {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            color: #1e3c72;
        }
        .page-size-buttons{
		    display:flex;
		    gap:10px;
		    margin-bottom:15px;
		}
		
		.size-btn{
		    background:linear-gradient(135deg,#1e3a8a,#2563eb);
		    color:white;
		    border:none;
		    padding:10px 18px;
		    border-radius:12px;
		    font-weight:700;
		    cursor:pointer;
		    box-shadow:0 4px 12px rgba(0,0,0,.2);
		    transition:.2s;
		}
		
		.size-btn:hover{
		    transform:translateY(-2px);
		}
		
		.size-btn.active{
		    background:linear-gradient(135deg,#1e3c72,#2a5298);
		}
        
        
        #recordsPerPage{
		    width:80px;
		    text-align:center;
		}
		        

        .records-per-page select {
            padding: 7px 11px;
            border: 2px solid #2a5298;
            border-radius: 8px;
            background: white;
            color: #1e3c72;
            font-weight: 600;
            cursor: pointer;
        }

        .pagination-nav {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .page-info {
            font-weight: 600;
            color: #1e3c72;
            padding: 7px 13px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 15px;
            border: 2px solid rgba(42, 82, 152, 0.2);
        }

        .pagination-btn {
            background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);
            color: white;
            border: none;
            padding: 9px 14px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
            box-shadow: 0 3px 10px rgba(42, 82, 152, 0.3);
        }

        .pagination-btn:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4);
        }

        .pagination-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            box-shadow: none;
        }

        /* Table Styles */
        .table-wrapper {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        thead {
            background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%);
        }

        th {
            padding: 14px 10px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
            color: white;
            border: none;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            letter-spacing: 0.3px;
        }

        tbody tr {
            background: white;
            transition: all 0.3s ease;
        }

        tbody tr:nth-child(even) {
            background: #f8f9fa;
        }

        tbody tr:hover {
            background: linear-gradient(45deg, #e3f2fd, #f0f8ff);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(44, 90, 160, 0.15);
        }

        td {
            padding: 12px 10px;
            border-bottom: 1px solid #e9ecef;
            font-size: 13px;
            color: #2d3436;
            text-align: left;
            vertical-align: middle;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-closed {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-live {
            background: #d1fae5;
            color: #065f46;
        }

        .status-upcoming {
            background: #dbeafe;
            color: #1e40af;
        }

        .status-draft {
            background: #fef3c7;
            color: #92400e;
        }

        .action-icons {
            display: flex;
            gap: 6px;
            justify-content: center;
        }

        .action-icon {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
            font-size: 14px;
        }

        .action-icon:hover {
            transform: translateY(-2px);
        }

        .icon-view {
            background: #dbeafe;
            color: #1e40af;
        }

        .icon-view:hover {
            background: #1e40af;
            color: white;
        }

        .icon-print {
            background: #fef3c7;
            color: #92400e;
        }

        .icon-print:hover {
            background: #f59e0b;
            color: white;
        }

        .icon-email {
            background: #e0e7ff;
            color: #4338ca;
        }

        .icon-email:hover {
            background: #4338ca;
            color: white;
        }

        .icon-download {
            background: #d1fae5;
            color: #065f46;
        }

        .icon-download:hover {
            background: #10b981;
            color: white;
        }

        .no-data {
            text-align: center;
            padding: 50px 20px;
            color: #9ca3af;
            font-size: 16px;
        }

        .no-data i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.5;
        }

        /* Entries and Search Bar */
        .entries-search-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background: white;
            border: 1px solid #e5e7eb;
            margin-bottom: 10px;
        }

        .entries-control {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #374151;
        }

        .entries-control label,
        .entries-control span {
            font-weight: 500;
        }

        .entries-select {
            padding: 6px 10px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 14px;
            background: white;
            cursor: pointer;
        }

        .search-control {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #374151;
        }

        .search-control label {
            font-weight: 500;
        }

        .search-input {
            padding: 6px 10px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 14px;
            width: 200px;
        }

        .search-input:focus {
            outline: none;
            border-color: #74b9ff;
            box-shadow: 0 0 0 2px rgba(116, 185, 255, 0.1);
        }

        /* Showing Info */
        .showing-info {
            padding: 10px 20px;
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-top: none;
            font-size: 14px;
            color: #374151;
        }

        /* Content Area - Updated */
        .content-area {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-top: none;
            padding: 20px;
            margin-bottom: 0;
        }

        .content-message {
            line-height: 1.8;
        }

        .content-message p {
            margin-bottom: 15px;
            font-size: 14px;
            color: #374151;
        }

        .content-message p:last-child {
            margin-bottom: 0;
        }

        .content-message a {
            color: #dc2626;
            text-decoration: none;
            font-weight: 600;
        }

        .content-message a:hover {
            text-decoration: underline;
        }

        .highlight-text {
            background: #fff4e6;
            color: #000;
            padding: 15px 20px;
            border-radius: 0;
            text-align: center;
            font-weight: 400;
            font-size: 14px;
            border: 1px solid #fed7aa;
            margin-top: 15px;
        }

        .highlight-text a {
            color: #ea580c;
            text-decoration: none;
            font-weight: 700;
        }

        .highlight-text a:hover {
            text-decoration: underline;
        }

        /* Bottom Info Section */
        .bottom-info-section {
            background: white;
            border: 1px solid #e5e7eb;
            border-top: none;
            padding: 20px;
        }

        .showing-info-bottom {
            padding: 10px 0;
            font-size: 14px;
            color: #374151;
            margin-bottom: 15px;
        }

        .pagination-numbers {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 5px;
            padding: 15px 0;
            border-top: 1px solid #e5e7eb;
            border-bottom: 1px solid #e5e7eb;
        }

        .page-num-btn {
            padding: 6px 12px;
            border: 1px solid #d1d5db;
            background: white;
            color: #374151;
            cursor: pointer;
            border-radius: 4px;
            transition: all 0.2s;
            font-size: 14px;
            font-weight: 500;
        }

        .page-num-btn:hover:not(:disabled):not(.active) {
            background: #f3f4f6;
        }

        .page-num-btn.active {
            background: #3b82f6;
            color: white;
            border-color: #3b82f6;
        }

        .page-num-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .page-dots {
            padding: 0 5px;
            color: #6b7280;
        }

        .bottom-content-message {
            padding: 20px;
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            margin-top: 15px;
            line-height: 1.8;
        }

        .bottom-content-message p {
            margin-bottom: 12px;
            font-size: 14px;
            color: #374151;
        }

        .bottom-content-message p:last-child {
            margin-bottom: 0;
        }

        .bottom-content-message a {
            color: #dc2626;
            text-decoration: none;
            font-weight: 600;
        }

        .bottom-content-message a:hover {
            text-decoration: underline;
        }

        .highlight-text-bottom {
            background: #fff4e6;
            color: #000;
            padding: 12px 20px;
            border-radius: 0;
            text-align: center;
            font-weight: 400;
            font-size: 14px;
            border: 1px solid #fed7aa;
            margin-top: 12px;
        }

        .highlight-text-bottom a {
            color: #ea580c;
            text-decoration: none;
            font-weight: 700;
        }

        .highlight-text-bottom a:hover {
            text-decoration: underline;
        }
		        
		 /* ===== MODERN INFO BOX ===== */
		
		.info-box-container{
    width:100%;
    max-width:1400px;        /* ⭐ full width */
    margin:30px auto;
    display:flex;
    justify-content:space-between;  /* ⭐ stretch both sides */
    gap:25px;
    margin-top:25px;
}

		
		.info-box{
			width:100%;
			max-width:90%;
			
			background:white;
			border-radius:12px;
			padding:20px;
			box-shadow:0 4px 15px rgba(0,0,0,.1);
			border-left:5px solid;
			transition:.3s;
		}
		
		.info-box:hover{
		transform:translateY(-4px);
		box-shadow:0 8px 25px rgba(0,0,0,.2);
		}
		
		.info-box.blue{
		border-color:#2563eb;
		}
		
		.info-box.orange{
		border-color:#f59e0b;
		}
		
		.info-box h4{
		margin-bottom:10px;
		color:#1e3a8a;
		}
		
		.info-box a{
		color:#dc2626;
		font-weight:600;
		text-decoration:none;
		}
		
		.info-box a:hover{
		text-decoration:underline;
		}
		        

        /* Footer */
        .footer {
            background-color: #05173c;
            color: white;
            text-align: center;
            padding: 16px 10px;
            font-size: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            width: 100%;
            margin-top: auto;
        }

        .footer img {
            height: 50px;
            width: auto;
            vertical-align: middle;
            object-fit: contain;
        }

        .footer-text {
            margin-left: 10px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .ireps-header {
                flex-direction: column;
                gap: 15px;
                padding: 15px;
            }

            .center-section {
                transform: translateX(0);
            }

            .main-title {
                font-size: 24px;
            }

            .sub-title {
                font-size: 22px;
            }

            .right-section {
                align-items: center;
                margin-right: 0;
            }

            .nav-tabs {
                flex-direction: column;
            }

            .nav-tab {
                border-right: none;
                border-bottom: 1px solid #d1d5db;
            }

            .nav-tab:last-child {
                border-bottom: none;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .date-range {
                grid-template-columns: 1fr;
            }

            .date-separator {
                display: none;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            table {
                font-size: 12px;
            }

            td, th {
                padding: 10px 6px;
            }

            .action-icons {
                gap: 4px;
                flex-wrap: wrap;
            }

            .action-icon {
                width: 30px;
                height: 30px;
                font-size: 12px;
            }

            .pagination-controls{
			    display:flex;
			    justify-content:space-between;
			    align-items:center;
			    gap:15px;
			    flex-wrap:wrap;
			    margin-bottom:18px;  
			}

            #tableBody{
 				transition: opacity .2s;
			}
			
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="ireps-header">
        <div class="left-section">
            <span class="menu-icon" onclick="openSidebar()">&#9776;</span>
            <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="Logo">
        </div>
        <div class="center-section">
            <div class="main-title">Government eMarketplace</div>
            <div class="sub-title">Indian Railways E-Procurement System</div>
        </div>
        <div class="right-section">
            <div class="lang-container">
                <label for="language">Select Your Language</label>
                <select id="language" class="language-dropdown">
                    <option value="en">English</option>
                    <option value="hi">Hindi</option>
                </select>
            </div>
            <div class="icon-row">
                <a href="${pageContext.request.contextPath}/logon" class="home-icon">
                    <i class="fa-solid fa-house"></i>
                </a>
                <a href="${pageContext.request.contextPath}/logon" class="logout-icon" onclick="logoutNow()">
                    <i class="fa-solid fa-right-from-bracket"></i>
                </a>
            </div>
        </div>
    </header>

    <!-- Sidebar -->
<div id="mySidebar" class="sidebar">
			<a href="javascript:void(0)" class="closebtn" onclick="closeSidebar()">&times;</a>

			<a href="javascript:void(0)" onclick="selectOption('hightender', this)">High Value Tenders</a>
    <a href="javascript:void(0)" onclick="selectOption('searchtender', this)">
        Search Tender
        
    </a>

			<a href="javascript:void(0)" onclick="selectOption('itemmaster', this)">Item Master</a>
			<a href="javascript:void(0)" onclick="selectOption('projection', this)">Procurement Projection</a>
			<a href="javascript:void(0)" onclick="selectOption('viewireps', this)">View Ireps Document</a>
			<a href="javascript:void(0)" onclick="selectOption('goods', this)">Goods and Services</a>
			<a href="javascript:void(0)" onclick="selectOption('auction', this)">Auction Leasing</a>
			<a href="javascript:void(0)" onclick="selectOption('SPO', this)">Search Purchase Orders</a>
			<a href="javascript:void(0)" onclick="selectOption('Eauction', this)">E-Auction System</a>
			<a href="javascript:void(0)" onclick="selectOption('LearningCenter', this)">Learning Center</a>
			<a href="javascript:void(0)" onclick="selectOption('BannedFirms', this)">Banned Firms</a>
			<a href="javascript:void(0)" onclick="selectOption('Helpdesk', this)">Helpdesk</a>
			<a href="javascript:void(0)" onclick="selectOption('Bidder', this)">New Bidder(E-Auction Sale)</a>
			<a href="javascript:void(0)" onclick="selectOption('DepartmentCreation', this)">Department Creation</a>
			<a href="javascript:void(0)" onclick="selectOption('BannedFirms', this)"></a>
		</div>

    <!-- Main Content -->
    <main class="main-container">
        <div class="container">
            <div id="successAlert" class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                <span id="successMessage"></span>
            </div>
            <div id="errorAlert" class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <span id="errorMessage"></span>
            </div>

			
			<div class="nav-container">

			    <div class="nav-tabs">
			
			        <a href="${pageContext.request.contextPath}/eps/Eauction/manage.do"
			           class="nav-tab ${activeTab == 'live' ? 'active' : ''}">
			            <i class="fas fa-circle"></i> Live Auction
			        </a>
			
			        <a href="${pageContext.request.contextPath}/eps/Eauction/forthcoming.do"
			           class="nav-tab ${activeTab == 'forthcoming' ? 'active' : ''}">
			            <i class="fas fa-clock"></i> Forthcoming Auction
			        </a>
			
			        <a href="${pageContext.request.contextPath}/eps/Eauction/schedule.do"
			           class="nav-tab ${activeTab == 'schedule' ? 'active' : ''}">
			            <i class="fas fa-calendar-check"></i> View Schedule
			        </a>
			
			    </div>
			
			</div>
						
            <!-- TAB 1: LIVE AUCTION -->
            <div id="liveTab" class="tab-content ${activeTab == 'live' ? 'active' : ''}">
                <!-- Show Entries and Search -->
                <div class="entries-search-bar">
                    <div class="entries-control">
                        <label>Show</label>
                        <select id="liveEntriesSelect" class="entries-select">
                            <option value="10" selected>10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        <span>entries</span>
                    </div>
                    <div class="search-control">
                        <label>Search:</label>
                        <input type="text" id="liveSearchInput" class="search-input" placeholder="">
                    </div>
                </div>

                <!-- Showing Entries Info -->
                <div class="showing-info">
                    Showing 1 to 1 of 1 entries
                </div>

                <!-- Content Area -->
                <div class="content-area">
                    <div class="content-message">
                        <p><strong>Bidders shall be able to view and print the lots and other details related to lots/auction to be put in the auctions or for a particular auction date. This can be done from the new button "-view published data for upcoming auctions", on their home page.</strong></p>
                        
                        <p>To View user manual for bidders for Lot Publishing Module, please 
                            <a href="#" onclick="openUserManual()"><strong>Click Here.</strong></a>
                        </p>
                        
                        <p>To view brief instructions to Bidders on migration to "Lot Publishing Module" please 
                            <a href="#" onclick="openMigrationGuide()"><strong>Click Here.</strong></a>
                        </p>
                        
                        <p class="highlight-text">
                            To view published data for upcoming auctions, please 
                            <a href="#" onclick="viewPublishedData()"><strong>Click Here..</strong></a>
                        </p>
                    </div>
                </div>
            </div>

            <!-- TAB 2: FORTHCOMING AUCTION -->
            <div id="forthcomingTab" class="tab-content ${activeTab == 'forthcoming' ? 'active' : ''}">
                <!-- Show Entries and Search -->
                <div class="entries-search-bar">
                    <div class="entries-control">
                        <label>Show</label>
                        <select id="forthcomingEntriesSelect" class="entries-select">
                            <option value="10" selected>10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        <span>entries</span>
                    </div>
                    <div class="search-control">
                        <label>Search:</label>
                        <input type="text" id="forthcomingSearchInput" class="search-input" placeholder="">
                    </div>
                </div>

                <!-- Showing Entries Info -->
                <div class="showing-info">
                    Showing 1 to 1 of 1 entries
                </div>

                <!-- Content Area -->
                <div class="content-area">
                    <div class="content-message">
                        <p><strong>Bidders shall be able to view and print the lots and other details related to lots/auction to be put in the auctions or for a particular auction date. This can be done from the new button "-view published data for upcoming auctions", on their home page.</strong></p>
                        
                        <p>To View user manual for bidders for Lot Publishing Module, please 
                            <a href="#" onclick="openUserManual()"><strong>Click Here.</strong></a>
                        </p>
                        
                        <p>To view brief instructions to Bidders on migration to "Lot Publishing Module" please 
                            <a href="#" onclick="openMigrationGuide()"><strong>Click Here.</strong></a>
                        </p>
                        
                        <p class="highlight-text">
                            To view published data for upcoming auctions, please 
                            <a href="#" onclick="viewPublishedData()"><strong>Click Here..</strong></a>
                        </p>
                    </div>
                </div>
            </div>

            <!-- TAB 3: VIEW SCHEDULE -->
            <div id="scheduleTab" class="tab-content ${activeTab == 'schedule' ? 'active' : ''}">
           
                
                	<fieldset class="search-card-fieldset">
					
					    <legend>
					        <i class="fas fa-calendar-check"></i>
					        View Auction Schedule
					    </legend>
                    
                      <!-- Navigation Tabs -->
				   

                    <div class="search-content">
						<form id="filterForm">
						
						    <!-- ROW 1 -->
						    <div class="form-grid">
						
						        <div class="form-group">
						            <label for="orgType">Organization Type <span class="required">*</span></label>
						            <select id="orgType" class="form-control">
						                <option value="ALL">All Organizations</option>
						                <option value="RAILWAY">Indian Railway</option>
						                <option value="DMRC">DMRC</option>
						                <option value="OTHERS">Others</option>
						            </select>
						        </div>
						
						        <div class="form-group">
						            <label for="accountId">Account / Railway Unit</label>
						            <select id="accountId" class="form-control">
						                <option value="ALL">All Accounts</option>
						                <c:forEach items="${accountList}" var="account">
						                    <option value="<c:out value='${account.ACCOUNT_ID}'/>">
						                        <c:out value="${account.ACCOUNT_NAME}"/>
						                    </option>
						                </c:forEach>
						            </select>
						        </div>
						
						        <div class="form-group">
						            <label for="depotId">Depot</label>
						            <select id="depotId" class="form-control">
						                <option value="ALL">All Depots</option>
						            </select>
						        </div>
						
						    </div>
						
						
						    <!-- ROW 2 -->
						    <div class="form-grid">
						
						        <!-- Auction Status FIRST -->
						        <div class="form-group">
						            <label for="catalogStatus">Auction Status</label>
						            <select id="catalogStatus" class="form-control">
						                <option value="ALL">All Status</option>
						                <option value="LIVE">Live</option>
						                <option value="UNDER_DECISION">Under Decision</option>
						                <option value="UPCOMING">Upcoming Auction</option>
						            </select>
						        </div>
						
						
						        <!-- From Date SECOND -->
						        <div class="form-group">
						            <label for="fromDate">From Date</label>
						            <input type="date" id="fromDate" class="form-control">
						        </div>
						
						
						        <!-- To Date THIRD -->
						        <div class="form-group">
						            <label for="toDate">To Date</label>
						            <input type="date" id="toDate" class="form-control">
						        </div>
						
						    </div>
						
						
						
						    <!-- BUTTONS SAME -->
						    <div class="action-buttons">
						
						        <button type="submit" class="btn btn-primary">
						            <i class="fas fa-search"></i> Search
						        </button>
						
						        <button type="reset" class="btn btn-secondary" onclick="resetFilters()">
						            <i class="fas fa-redo-alt"></i> Reset
						        </button>
						
						        <button type="button" class="btn btn-success" onclick="window.location.href='/'">
						            <i class="fas fa-home"></i> Home
						        </button>
						
						        <button type="button" class="btn btn-warning" onclick="window.print()">
						            <i class="fas fa-print"></i> Print
						        </button>
						
						    </div>
						
						</form>
					

                </fieldset>
                
                

                <div id="loadingSpinner" class="loading">
                    <div class="spinner"></div>
                    <p>Loading auction schedules...</p>
                </div>

                <!-- Results Section -->
                <div id="resultsSection" class="results-section" style="display: none;">
                    <div class="results-header">

					    <h3>Search Results</h3>
					
					    <div style="display:flex; align-items:center; gap:15px;">
					
					        <!-- ⭐ ENTERPRISE SEARCH BOX -->
					        <div class="search-control">
					
					            <label style="color:white; font-weight:600;">Search:</label>
					
					            <input type="text"
					                   id="scheduleSearchInput"
					                   class="search-input"
					                   placeholder=""
					                   style="
					                        height:32px;
					                        border-radius:6px;
					                        border:none;
					                        padding:6px 10px;
					                   ">
					
					        </div>
					
					        <!-- TOTAL COUNT -->
					        <span class="total-count" id="totalCount">
					            Total: 0
					        </span>
					
					    </div>
					
					</div>

                    <!-- Pagination Controls -->
                    <div class="pagination-controls" id="paginationControls">
                        <div class="results-info">
                            <div class="records-per-page">
							    <label>Records Per Page:</label>
							
							    <div class="page-size-buttons">
							        <button type="button" class="size-btn active" data-size="10">10</button>
							        <button type="button" class="size-btn" data-size="20">20</button>
							        <button type="button" class="size-btn" data-size="50">50</button>

							    </div>
							</div>
                            
                        </div>
                        <div class="pagination-nav">
                            <div class="page-info" id="pageInfo">Page 1 of 1</div>
                            <button class="pagination-btn" id="prevPage" disabled>
                                <i class="fas fa-chevron-left"></i> Previous
                            </button>
                            <button class="pagination-btn" id="nextPage" disabled>
                                Next <i class="fas fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>

                    <div class="table-wrapper">
                        <table id="resultsTable">
                            <thead>
                                <tr>
                                    <th style="width:50px;">#</th>
                                    <th style="width:150px;">Schedule No.</th>
                                    <th style="width:200px;">Railway Unit</th>
                                    <th style="width:150px;">Depot</th>
                                    <th style="width:120px;">Status</th>
                                    <th style="width:150px;">Auction Start</th>
                                    <th style="width:150px;">Auction End</th>
                                    <th style="width:180px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <tr>
                                    <td colspan="8" class="no-data">
                                        <i class="fas fa-inbox"></i>
                                        <div>Click Search button to view auction schedules</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Bottom Information Section -->
                    

                        <!-- Bottom Content Messages -->
                       <div class="info-box-container">
						
						    <div class="info-box blue">
						
						        <h4>
						            <i class="fas fa-info-circle"></i>
						            Auction Details
						        </h4>
						
						        <p>
								Bidders shall be able to view and print the lots and other details related to 
								lots/auction to be put in the auctions or for a particular auction date. 
								This can be done from the new button
								<strong>"View Published Data for upcoming auctions"</strong>
								on their home page.
								</p>

						
						    </div>
						
						
						    <div class="info-box orange">
						
						        <h4>
						            <i class="fas fa-book"></i>
						            Manual & Instructions
						        </h4>
						
						        <p>

								To View user manual for bidders for Lot Publishing Module, please
								
								<a href="#" onclick="openUserManual()">
								Click Here.
								</a>
								
								<br><br>
								
								To view brief instructions to Bidders on migration to "Lot Publishing Module" please
								
								<a href="#" onclick="openMigrationGuide()">
								Click Here.
								</a>
								
								<br><br>
								
								To view Lot Details and Other information for upcoming auctions, please
								
								<a href="#" onclick="viewPublishedData()">
								Click Here.
								</a>
								
								</p>

						
						    </div>
						
						</div>
                       
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <img src="${pageContext.request.contextPath}/assets/images/stqc.png" alt="STQC">
        <img src="${pageContext.request.contextPath}/assets/images/cris.png" alt="CRIS">
        <div class="footer-text">
            Centre For Railway Information Systems, Designed, Developed and Hosted by CRIS &nbsp;
            <strong>Version 7.1.0</strong>
        </div>
    </footer>

    <script>
    const contextPath = '<c:out value="${pageContext.request.contextPath}"/>';
    const ctx = contextPath;
    
    // Global pagination variables
    let allAuctions = [];
    let currentPage = 1;
    let recordsPerPage = 10;
    let totalPages = 1;

    document.addEventListener('DOMContentLoaded', function() {
        console.log('%c=== PAGE LOADED ===', 'color: green; font-weight: bold; font-size: 14px');
        console.log('Context Path:', contextPath);
        console.log('Active Tab:', '${activeTab}');
        
        loadInitialAccounts();
        setupEventListeners();
        
        document.getElementById("fromDate").addEventListener("click", function(){
            this.showPicker();
        });

        document.getElementById("toDate").addEventListener("click", function(){
            this.showPicker();
        });
        
     // disable To Date initially

        document.getElementById("toDate").disabled = true;


        // enable when From Date selected

        document.getElementById("fromDate").addEventListener("change", function(){

            document.getElementById("toDate").disabled = false;

        });
        
        document.getElementById("fromDate").addEventListener("change", function(){

            this.style.border = "2px solid #ddd";

        });


        document.getElementById("toDate").addEventListener("change", function(){

            this.style.border = "2px solid #ddd";

        });
    });

    /*function switchTab(tabName) {
        console.log('%c>>> Switching to tab: ' + tabName, 'color: purple; font-weight: bold');
        
        document.querySelectorAll('.tab-content').forEach(tab => {
            tab.classList.remove('active');
        });
        
        document.querySelectorAll('.nav-tab').forEach(tab => {
            tab.classList.remove('active');
        });
        
        if (tabName === 'live') {
            document.getElementById('liveTab').classList.add('active');
            document.querySelectorAll('.nav-tab')[0].classList.add('active');
            window.history.pushState({}, '', contextPath + '/eps/Eauction/manage.do');
        } else if (tabName === 'forthcoming') {
            document.getElementById('forthcomingTab').classList.add('active');
            document.querySelectorAll('.nav-tab')[1].classList.add('active');
            window.history.pushState({}, '', contextPath + '/eps/Eauction/forthcoming.do');
        } else if (tabName === 'schedule') {
            document.getElementById('scheduleTab').classList.add('active');
            document.querySelectorAll('.nav-tab')[2].classList.add('active');
            window.history.pushState({}, '', contextPath + '/eps/Eauction/schedule.do');
        }
    }*/

    function setupEventListeners() {
        document.getElementById('orgType').addEventListener('change', onOrgTypeChange);
        document.getElementById('accountId').addEventListener('change', onAccountChange);
        document.getElementById('filterForm').addEventListener('submit', onFormSubmit);
        
        // Records per page change handler
        // Page size buttons click
		document.querySelectorAll('.size-btn').forEach(btn=>{
		    btn.addEventListener('click',function(){
		
		        document.querySelectorAll('.size-btn')
		        .forEach(b=>b.classList.remove('active'));
		
		        this.classList.add('active');
		
		        recordsPerPage = parseInt(this.dataset.size);
		        currentPage = 1;
		        searchAuctions();   // ⭐ reload from server

		    });
		});

        
		// ⭐ Schedule No automatic search

	/*	let scheduleSearchTimeout;

		document.getElementById('scheduleSearchInput')
		.addEventListener('input', function(){
		
		    clearTimeout(scheduleSearchTimeout);
		
		    currentPage = 1;
		
		    scheduleSearchTimeout = setTimeout(function(){

		        const value = document.getElementById('scheduleSearchInput').value.trim();

		        // Always search — but controlled
		        searchAuctions();

		    }, 400);

		});    */



        
        // Previous button click
        document.getElementById('prevPage').addEventListener('click', function() {
		    if (currentPage > 1) {
		        currentPage--;
		        searchAuctions();   // ⭐ reload from server
		    }
		});




        // Next button click
        document.getElementById('nextPage').addEventListener('click', function() {
            if (currentPage < totalPages) {
                currentPage++;
                searchAuctions();   // ⭐ reload from server
            }
        });

	
     // ⭐ Enterprise Schedule Search

        let searchTimeout;

        document.getElementById('scheduleSearchInput')
        .addEventListener('input', function(){

            clearTimeout(searchTimeout);

            currentPage = 1;

            searchTimeout = setTimeout(function(){

                searchAuctions();

            }, 400);

        }); 
        

    }

    function loadInitialAccounts() {
        console.log('%c>>> Loading Initial Accounts', 'color: blue; font-weight: bold');
        
        fetch(contextPath + '/eps/Eauction/getAccounts')
            .then(response => {
                console.log('Response status:', response.status);
                console.log('Content-Type:', response.headers.get('content-type'));
                
                if (!response.ok) {
                    throw new Error('HTTP ' + response.status + ': ' + response.statusText);
                }
                return response.text(); // ✅ Read as text first
            })
            .then(text => {
                console.log('Raw response length:', text.length);
                console.log('Raw response (first 200 chars):', text.substring(0, 200));
                
                // ✅ Check if response is empty
                if (!text || text.trim().length === 0) {
                    throw new Error('Empty response from server');
                }
                
                // ✅ Try to parse JSON
                let data;
                try {
                    data = JSON.parse(text);
                } catch (e) {
                    console.error('JSON Parse Error:', e);
                    console.error('Response text:', text);
                    throw new Error('Invalid JSON response from server');
                }
                
                console.log('Parsed data:', data);
                
                // ✅ Handle new response format with success/data structure
                if (data.success && data.data) {
                    console.log('%c✓ Accounts loaded: ' + data.count, 'color: green');
                    populateAccountDropdown(data.data);
                } else if (Array.isArray(data)) {
                    // ✅ Handle old format (direct array)
                    console.log('%c✓ Accounts loaded (legacy format): ' + data.length, 'color: green');
                    populateAccountDropdown(data);
                } else {
                    console.warn('Unexpected data format:', data);
                    showError('Unexpected data format from server');
                }
            })
            .catch(error => {
                console.error('%c✗ Error loading accounts:', 'color: red', error);
                showError('Failed to load accounts: ' + error.message);
            });
    }

    function onOrgTypeChange() {
        const orgType = document.getElementById('orgType').value;
        console.log('%c>>> Organization Type Changed: "' + orgType + '"', 'color: blue; font-weight: bold');

        const url = contextPath + '/eps/Eauction/getAccounts?orgType=' + encodeURIComponent(orgType);
        console.log('Fetching URL:', url);

        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('HTTP ' + response.status);
                }
                return response.text(); // ✅ Read as text first
            })
            .then(text => {
                console.log('Raw response:', text.substring(0, 200));
                
                if (!text || text.trim().length === 0) {
                    throw new Error('Empty response from server');
                }
                
                const data = JSON.parse(text);
                
                // ✅ Handle both response formats
                if (data.success && data.data) {
                    console.log('%c✓ Accounts loaded: ' + data.count, 'color: green');
                    populateAccountDropdown(data.data);
                } else if (Array.isArray(data)) {
                    console.log('%c✓ Accounts loaded: ' + data.length, 'color: green');
                    populateAccountDropdown(data);
                }
                
                document.getElementById('depotId').innerHTML = '<option value="">-- Select Depot --</option>';
            })
            .catch(error => {
                console.error('%c✗ Error loading accounts:', 'color: red', error);
                showError('Failed to load accounts: ' + error.message);
            });
    }

    function onAccountChange() {
        const accountId = document.getElementById('accountId').value;
        console.log('%c>>> Account Changed: ' + accountId, 'color: blue');

        if (!accountId) {
            document.getElementById('depotId').innerHTML = '<option value="">-- Select Depot --</option>';
            return;
        }

        const url = contextPath + '/eps/Eauction/getDepots?accountId=' + encodeURIComponent(accountId);

        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('HTTP ' + response.status);
                }
                return response.text(); // ✅ Read as text first
            })
            .then(text => {
                if (!text || text.trim().length === 0) {
                    throw new Error('Empty response from server');
                }
                
                const data = JSON.parse(text);
                
                // ✅ Handle both response formats
                if (data.success && data.data) {
                    console.log('%c✓ Depots loaded: ' + data.count, 'color: green');
                    populateDepotDropdown(data.data);
                } else if (Array.isArray(data)) {
                    console.log('%c✓ Depots loaded: ' + data.length, 'color: green');
                    populateDepotDropdown(data);
                }
            })
            .catch(error => {
                console.error('%c✗ Error loading depots:', 'color: red', error);
                showError('Failed to load depots: ' + error.message);
            });
    }

    function populateAccountDropdown(data) {
        const select = document.getElementById('accountId');
        select.innerHTML = '<option value="ALL">All Account</option>';

        if (data && data.length > 0) {
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = escapeHtml(item.ACCOUNT_ID);
                option.textContent = item.ACCOUNT_NAME;
                select.appendChild(option);
            });
            console.log('✓ Account dropdown populated with ' + data.length + ' items');
        } else {
            console.warn('No account data to populate');
        }
    }

    function populateDepotDropdown(data) {
        const select = document.getElementById('depotId');
        select.innerHTML = '<option value="ALL">All Depots</option>';

        if (data && data.length > 0) {
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = escapeHtml(item.DEPOT_ID);
                option.textContent = item.DEPOT_NAME;
                select.appendChild(option);
            });
            console.log('✓ Depot dropdown populated with ' + data.length + ' items');
        } else {
            console.warn('No depot data to populate');
        }
    }

    /*function onFormSubmit(e) {
        e.preventDefault();
        currentPage = 1;
        searchAuctions();
    }*/
    
    function onFormSubmit(e) {

        e.preventDefault();

        const fromDate = document.getElementById('fromDate').value;
        const toDate   = document.getElementById('toDate').value;
        
     // check invalid date range

     // check invalid date range

        if(fromDate && toDate && toDate < fromDate){
			
        	//Sweet Alert
        	Swal.fire({
        	    icon: 'error',
        	    title: 'Invalid Date',
        	    text: 'To Date cannot be less than From Date',
        	    confirmButtonColor: '#1e3a8a'
        	});

            // ⭐ ERROR MESSAGE BAR
            showError("To Date cannot be less than From Date");

            // ⭐ RED BORDER
            document.getElementById('toDate').style.border = "2px solid red";

            // ⭐ FOCUS
            document.getElementById('toDate').focus();

            return;
        }

        // Reset border first
        document.getElementById('fromDate').style.border = "2px solid #ddd";
        document.getElementById('toDate').style.border = "2px solid #ddd";


     // ✅ CASE 1: From selected but To empty
        if (fromDate && !toDate) {

            Swal.fire({
                icon: 'warning',
                title: 'To Date Required',
                text: 'Please select To Date',
                confirmButtonColor: '#1e3a8a'
            });

            showError("Please select To Date");

            document.getElementById('toDate').style.border = "2px solid red";

            document.getElementById('toDate').focus();

            return;
        }


     // ✅ CASE 2: To selected but From empty
        if (!fromDate && toDate) {

            Swal.fire({
                icon: 'warning',
                title: 'From Date Required',
                text: 'Please select From Date',
                confirmButtonColor: '#1e3a8a'
            });

            showError("Please select From Date");

            document.getElementById('fromDate').style.border = "2px solid red";

            document.getElementById('fromDate').focus();

            return;
        }


        // ✅ CASE 3: valid → allow search

        currentPage = 1;

        searchAuctions();

    }

    function searchAuctions() {
        showLoading(true);
        clearAlerts();

        const params = new URLSearchParams({
        	orgType: document.getElementById('orgType').value === "ALL" ? "" : document.getElementById('orgType').value,
        	accountId: document.getElementById('accountId').value === "ALL" ? "" : document.getElementById('accountId').value,
        	depotId: document.getElementById('depotId').value === "ALL" ? "" : document.getElementById('depotId').value,
        	catalogStatus: getCatalogStatusValue(),
            fromDate: document.getElementById('fromDate').value || '',
            toDate: document.getElementById('toDate').value || '',
            scheduleNo: document.getElementById('scheduleSearchInput').value,
            page: currentPage,
            pageSize: recordsPerPage
        });

        console.log('%c>>> Searching Auctions', 'color: purple; font-weight: bold');
        console.log('Search params:', Object.fromEntries(params));

        fetch(contextPath + '/eps/Eauction/searchSchedule', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params
        })
        .then(response => {
            console.log('Response status:', response.status);
            console.log('Content-Type:', response.headers.get('content-type'));
            
            if (!response.ok) {
                throw new Error('HTTP ' + response.status + ': ' + response.statusText);
            }
            return response.text(); // ✅ Read as text first
        })
        .then(text => {
            console.log('Raw response length:', text.length);
            console.log('Raw response (first 500 chars):', text.substring(0, 500));
            
            showLoading(false);
            
            // ✅ Check if response is empty
            if (!text || text.trim().length === 0) {
                throw new Error('Empty response from server');
            }
            
            // ✅ Try to parse JSON
            let data;
            try {
                data = JSON.parse(text);
            } catch (e) {
                console.error('JSON Parse Error:', e);
                console.error('Response was:', text);
                
                // ✅ Check if it's HTML error page
                if (text.includes('<html>') || text.includes('<!DOCTYPE')) {
                    throw new Error('Server returned HTML instead of JSON. Check server logs for errors.');
                } else {
                    throw new Error('Invalid JSON response from server');
                }
            }
            
            console.log('✓ Parsed data:', data);

            if (data.success) {
                allAuctions = data.results || [];
                window.serverTotalCount = data.totalCount || allAuctions.length;
                displayResults(data);
                showSuccess('Found ' + data.totalCount + ' auction schedule(s)');
            } else {
                showError(data.error || 'Search failed');
                document.getElementById('tableBody').innerHTML = 
                    '<tr><td colspan="8" class="no-data"><i class="fas fa-exclamation-circle"></i><div>' + 
                    escapeHtml(data.error || 'No results found') + '</div></td></tr>';
                document.getElementById('resultsSection').style.display = 'none';
            }
        })
        .catch(error => {
            console.error('%c✗ Search error:', 'color: red; font-weight: bold', error);
            showLoading(false);
            showError('Search failed: ' + error.message);
            document.getElementById('resultsSection').style.display = 'none';
        });
    }
	
    function getCatalogStatusValue(){

        const status = document.getElementById('catalogStatus').value;

        if(status === "LIVE") return "1";

        if(status === "UNDER_DECISION") return "0";

        if(status === "UPCOMING") return "2";

        return "";

    }

    
    function displayResults(data) {

        document.getElementById('resultsSection').style.display = 'block';

        if (!data.results || data.results.length === 0) {

            window.serverTotalCount = 0;
            totalPages = 0;

            document.getElementById('totalCount').textContent = 'Total: 0';

            document.getElementById('tableBody').innerHTML =
                '<tr><td colspan="8" class="no-data">' +
                '<i class="fas fa-search"></i><div>No auction schedules found</div></td></tr>';

            document.getElementById('paginationControls').style.display = 'none';

            return;

        }

        // ⭐ IMPORTANT — use server pagination values
        allAuctions = data.results || [];
        window.serverTotalCount = data.totalCount || allAuctions.length;
        totalPages = parseInt(data.totalPages || 0);
        currentPage = data.currentPage || 1;

        updatePaginationInfo();
        displayCurrentPageData();
    }


    function updatePaginationInfo() {

        const totalRecords = window.serverTotalCount || allAuctions.length;

        // ✅ server se aaya totalPages use karo
        totalPages = totalPages;

        document.getElementById('totalCount').textContent =
            'Total: ' + totalRecords;

        document.getElementById('pageInfo').textContent =
            'Page ' + currentPage + ' of ' + totalPages;

        document.getElementById('prevPage').disabled = currentPage <= 1;
        document.getElementById('nextPage').disabled = currentPage >= totalPages;

        document.getElementById('paginationControls').style.display =
            totalPages > 0 ? 'flex' : 'none';
    }


    

    function displayCurrentPageData() {

        if (!allAuctions || allAuctions.length === 0) {
            document.getElementById('tableBody').innerHTML =
                '<tr><td colspan="8" class="no-data">No records found</td></tr>';
            return;
        }

        let rows = '';

        allAuctions.forEach((auction, index) => {

            const globalIndex = (currentPage - 1) * recordsPerPage + index + 1;

            const statusClass = getStatusClass(auction.catalogStatusLabel);
            const statusLabel = auction.catalogStatusLabel || 'N/A';

            rows += '<tr>' +
                '<td style="text-align:center;">' + globalIndex + '</td>' +
                '<td><strong>' + escapeHtml(auction.scheduleNo || '') + '</strong></td>' +
                '<td>' + escapeHtml(auction.accountName || '') + '</td>' +
                '<td>' + escapeHtml(auction.depotName || '') + '</td>' +
                '<td><span class="status-badge ' + statusClass + '"><i class="fas fa-circle"></i> ' +
                escapeHtml(statusLabel) + '</span></td>' +
                '<td>' + escapeHtml(auction.auctionStartDatetime || '') + '</td>' +
                '<td>' + escapeHtml(auction.auctionEndDatetime || 'N/A') + '</td>' +
                '<td>' + generateActionButtons(auction) + '</td>' +
                '</tr>';
        });

        document.getElementById('tableBody').innerHTML = rows;
    }


    
    
    
    function updateTableWithoutScroll(callback){
        const scrollPos = window.scrollY;
        const table = document.getElementById('tableBody');

        table.style.opacity = "0";

        setTimeout(() => {
            callback();
            table.style.opacity = "1";
            window.scrollTo(0, scrollPos);
        }, 150);
    }

    function generateActionButtons(auction) {
        const catalogId = auction.catalogId;
        const catFilePath = auction.catFilePath;
        const scheduleNo = auction.scheduleNo;
        
        let buttons = '<div class="action-icons">';
        
        buttons += '<div class="action-icon icon-view" title="View Uniform E-Sale Conditions" ' +
            'onclick="viewUniformSalePDF()">' +
            '<i class="fas fa-eye"></i></div>';
        
        buttons += '<div class="action-icon icon-print" title="Print" ' +
            'onclick="printAuction(\'' + escapeHtml(scheduleNo) + '\')">' +
            '<i class="fas fa-print"></i></div>';
        
        buttons += '<div class="action-icon icon-email" title="View Catalog Details" ' +
            'onclick="viewCatalogDetails(\'' + catalogId + '\', \'' + escapeHtml(scheduleNo) + '\')">' +
            '<i class="fas fa-list-alt"></i></div>';
        
        const pdfAvailable = catalogId && catalogId !== -5 && catalogId !== '-5' && 
                            catFilePath && catFilePath.trim() !== '';
        
        if (pdfAvailable) {
            buttons += '<div class="action-icon icon-download" title="Download Catalog PDF" ' +
                'onclick="downloadCatalogPDF(\'' + catalogId + '\', \'' + escapeHtml(catFilePath) + '\', \'' + 
                escapeHtml(scheduleNo) + '\')">' +
                '<i class="fas fa-download"></i></div>';
        } else {
            buttons += '<div class="action-icon icon-download" title="PDF not available" ' +
                'style="opacity:0.5; cursor:not-allowed;" ' +
                'onclick="showError(\'Catalog PDF not available for this auction\')">' +
                '<i class="fas fa-download"></i></div>';
        }
        
        buttons += '</div>';
        return buttons;
    }

    // ================================================================
    // ACTION BUTTON FUNCTIONS
    // ================================================================

    function viewUniformSalePDF() {
        console.log('%c>>> BUTTON 1: Opening Uniform E-Sale Conditions PDF', 'color: green; font-weight: bold');
        const uniformSalePdfUrl = 'https://trial.ireps.gov.in/ireps/upload/resources/Uniform_E_Sale_condition.pdf';
        window.open(uniformSalePdfUrl, '_blank');
        showSuccess('Opening Uniform E-Sale Conditions PDF...');
    }

    function printAuction(scheduleNo) {
        console.log('%c>>> BUTTON 2: Print Auction', 'color: orange; font-weight: bold', scheduleNo);
        window.print();
    }

    function viewCatalogDetails(catalogId, scheduleNo) {
        console.log('%c>>> BUTTON 3: View Catalog Details', 'color: purple; font-weight: bold');
        console.log('Catalog ID:', catalogId, 'Schedule No:', scheduleNo);
        
        if (!catalogId || catalogId === -5 || catalogId === '-5' || catalogId == -5) {
            showError('Catalog details not available for this auction');
            console.warn('⚠ Invalid catalog ID:', catalogId);
            return;
        }
        
        const viewUrl = contextPath + '/eps/Eauction/viewCatalogDetails.do?catalogId=' + 
                        encodeURIComponent(catalogId) + '&scheduleNo=' + encodeURIComponent(scheduleNo);
        
        console.log('Opening URL:', viewUrl);
        window.open(viewUrl, '_blank');
        showSuccess('Opening catalog details...');
    }

    function downloadCatalogPDF(catalogId, catFilePath, scheduleNo) {
        console.log('%c>>> BUTTON 4: Download Catalog PDF', 'color: blue; font-weight: bold');
        console.log('Catalog ID:', catalogId, 'File Path:', catFilePath);
        
        if (!catalogId || catalogId === -5 || catalogId === '-5' || catalogId == -5) {
            showError('Invalid catalog ID');
            return;
        }
        
        if (catFilePath && catFilePath.trim() !== '') {
            const baseUrl = 'https://trial.ireps.gov.in';
            let fullPdfUrl;
            
            if (catFilePath.startsWith('http://') || catFilePath.startsWith('https://')) {
                fullPdfUrl = catFilePath;
            } else if (catFilePath.startsWith('/')) {
                fullPdfUrl = baseUrl + catFilePath;
            } else {
                fullPdfUrl = baseUrl + '/' + catFilePath;
            }
            
            console.log('%c✓ Opening Catalog PDF:', 'color: green; font-weight: bold', fullPdfUrl);
            window.open(fullPdfUrl, '_blank');
            showSuccess('Opening catalog PDF...');
            return;
        }
        
        fetch(contextPath + '/eps/Eauction/getCatalogPDF?catalogId=' + catalogId)
            .then(response => {
                if (!response.ok) {
                    throw new Error('HTTP ' + response.status);
                }
                return response.text();
            })
            .then(text => {
                if (!text || text.trim().length === 0) {
                    throw new Error('Empty response');
                }
                const data = JSON.parse(text);
                if (data.success && data.pdfUrl) {
                    window.open(data.pdfUrl, '_blank');
                    showSuccess('Opening catalog PDF...');
                } else {
                    showError(data.error || 'PDF not found');
                }
            })
            .catch(error => {
                console.error('✗ Error fetching PDF:', error);
                showError('Failed to load PDF: ' + error.message);
            });
    }

    function getStatusClass(status) {
        if (!status) return 'status-draft';
        const statusStr = String(status).toLowerCase();
        if (statusStr.includes('closed') || statusStr === '2') return 'status-closed';
        if (statusStr.includes('live') || statusStr === '1') return 'status-live';
        if (statusStr.includes('upcoming') || statusStr === '0') return 'status-upcoming';
        return 'status-draft';
    }

    function resetFilters() {
        document.getElementById('filterForm').reset();
        document.getElementById('scheduleSearchInput').value = '';
        document.getElementById('depotId').innerHTML = '<option value="">-- Select Depot --</option>';
     // ⭐ RESET RED BORDER ALSO
        document.getElementById('fromDate').style.border = "2px solid #ddd";
        document.getElementById('toDate').style.border   = "2px solid #ddd";
        document.getElementById('tableBody').innerHTML = 
            '<tr><td colspan="8" class="no-data"><i class="fas fa-inbox"></i><div>Click Search to view auction schedules</div></td></tr>';
        document.getElementById('resultsSection').style.display = 'none';
        clearAlerts();
        currentPage = 1;
        allAuctions = [];
        searchAuctions(); 
        console.log('✓ Filters reset');
    }

    function openUserManual() {
        const userManualUrl = 'https://trial.ireps.gov.in/ireps/upload/resources/BidderManual_LotPublishing.pdf';
        window.open(userManualUrl, '_blank');
        showSuccess('Opening Bidder Manual...');
    }
    
    function openMigrationGuide() {
        const migrationGuideUrl = 'https://trial.ireps.gov.in/ireps/upload/resources/Bidder_Instructions_Migration_for_lot_publishing.pdf';
        window.open(migrationGuideUrl, '_blank');
        showSuccess('Opening Migration Guide...');
    }
    
    function viewPublishedData() {
        showSuccess('Published data viewer will open');
    }

    function showLoading(show) {
        const spinner = document.getElementById('loadingSpinner');
        if (show) {
            spinner.classList.add('active');
        } else {
            spinner.classList.remove('active');
        }
    }

    function showSuccess(message) {
        const alert = document.getElementById('successAlert');
        document.getElementById('successMessage').textContent = message;
        alert.classList.add('active');
        setTimeout(function() { alert.classList.remove('active'); }, 4000);
    }

    function showError(message) {
        const alert = document.getElementById('errorAlert');
        document.getElementById('errorMessage').textContent = message;
        alert.classList.add('active');
        setTimeout(function() { alert.classList.remove('active'); }, 5000);
    }

    function clearAlerts() {
        document.getElementById('successAlert').classList.remove('active');
        document.getElementById('errorAlert').classList.remove('active');
    }

    function escapeHtml(text) {
        if (!text) return '';
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        return String(text).replace(/[&<>"']/g, function(m) { return map[m]; });
    }

    function openSidebar() {
        document.getElementById('mySidebar').style.width = '250px';
    }

    function closeSidebar() {
        document.getElementById('mySidebar').style.width = '0';
    }

    function selectOption(option, el) {
        console.log('Selected option:', option);
        document.querySelectorAll('.sidebar a').forEach(link => link.classList.remove('active-option'));
        if (el) el.classList.add('active-option');
        window.location.href = ctx + '/jsp/admin/home/login.jsp?redirect=' + option;
    }

    function logoutNow() {
        alert("Logout Successful");
        window.location.href = ctx + "/logonBody.jsp";
    }
</script>
</body>
</html>