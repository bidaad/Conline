﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConLine.Old_App_Code.DAL
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="SDB")]
	public partial class LogsDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertDotnetLog(DotnetLog instance);
    partial void UpdateDotnetLog(DotnetLog instance);
    partial void DeleteDotnetLog(DotnetLog instance);
    #endregion
		
		public LogsDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ConLineConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public LogsDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public LogsDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public LogsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public LogsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<DotnetLog> DotnetLogs
		{
			get
			{
				return this.GetTable<DotnetLog>();
			}
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.spInsertLog")]
		public int spInsertLog([global::System.Data.Linq.Mapping.ParameterAttribute(Name="UserAgent", DbType="VarChar(500)")] string userAgent, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Query", DbType="VarChar(500)")] string query, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="UserInfo", DbType="VarChar(100)")] string userInfo, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Host", DbType="VarChar(50)")] string host, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="AbsolutePath", DbType="VarChar(500)")] string absolutePath, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="LogDateTime", DbType="DateTime")] System.Nullable<System.DateTime> logDateTime, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Referrer", DbType="VarChar(500)")] string referrer, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Result", DbType="Int")] ref System.Nullable<int> result)
		{
			IExecuteResult result1 = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), userAgent, query, userInfo, host, absolutePath, logDateTime, referrer, result);
			result = ((System.Nullable<int>)(result1.GetParameterValue(7)));
			return ((int)(result1.ReturnValue));
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.DotnetLogs")]
	public partial class DotnetLog : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Code;
		
		private string _UserAgent;
		
		private string _Query;
		
		private string _UserInfo;
		
		private string _Host;
		
		private string _AbsolutePath;
		
		private System.Nullable<System.DateTime> _LogDateTime;
		
		private string _Referrer;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCodeChanging(int value);
    partial void OnCodeChanged();
    partial void OnUserAgentChanging(string value);
    partial void OnUserAgentChanged();
    partial void OnQueryChanging(string value);
    partial void OnQueryChanged();
    partial void OnUserInfoChanging(string value);
    partial void OnUserInfoChanged();
    partial void OnHostChanging(string value);
    partial void OnHostChanged();
    partial void OnAbsolutePathChanging(string value);
    partial void OnAbsolutePathChanged();
    partial void OnLogDateTimeChanging(System.Nullable<System.DateTime> value);
    partial void OnLogDateTimeChanged();
    partial void OnReferrerChanging(string value);
    partial void OnReferrerChanged();
    #endregion
		
		public DotnetLog()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Code", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Code
		{
			get
			{
				return this._Code;
			}
			set
			{
				if ((this._Code != value))
				{
					this.OnCodeChanging(value);
					this.SendPropertyChanging();
					this._Code = value;
					this.SendPropertyChanged("Code");
					this.OnCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserAgent", DbType="VarChar(500)")]
		public string UserAgent
		{
			get
			{
				return this._UserAgent;
			}
			set
			{
				if ((this._UserAgent != value))
				{
					this.OnUserAgentChanging(value);
					this.SendPropertyChanging();
					this._UserAgent = value;
					this.SendPropertyChanged("UserAgent");
					this.OnUserAgentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Query", DbType="VarChar(500)")]
		public string Query
		{
			get
			{
				return this._Query;
			}
			set
			{
				if ((this._Query != value))
				{
					this.OnQueryChanging(value);
					this.SendPropertyChanging();
					this._Query = value;
					this.SendPropertyChanged("Query");
					this.OnQueryChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserInfo", DbType="VarChar(500)")]
		public string UserInfo
		{
			get
			{
				return this._UserInfo;
			}
			set
			{
				if ((this._UserInfo != value))
				{
					this.OnUserInfoChanging(value);
					this.SendPropertyChanging();
					this._UserInfo = value;
					this.SendPropertyChanged("UserInfo");
					this.OnUserInfoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Host", DbType="VarChar(500)")]
		public string Host
		{
			get
			{
				return this._Host;
			}
			set
			{
				if ((this._Host != value))
				{
					this.OnHostChanging(value);
					this.SendPropertyChanging();
					this._Host = value;
					this.SendPropertyChanged("Host");
					this.OnHostChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AbsolutePath", DbType="VarChar(500)")]
		public string AbsolutePath
		{
			get
			{
				return this._AbsolutePath;
			}
			set
			{
				if ((this._AbsolutePath != value))
				{
					this.OnAbsolutePathChanging(value);
					this.SendPropertyChanging();
					this._AbsolutePath = value;
					this.SendPropertyChanged("AbsolutePath");
					this.OnAbsolutePathChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LogDateTime", DbType="DateTime")]
		public System.Nullable<System.DateTime> LogDateTime
		{
			get
			{
				return this._LogDateTime;
			}
			set
			{
				if ((this._LogDateTime != value))
				{
					this.OnLogDateTimeChanging(value);
					this.SendPropertyChanging();
					this._LogDateTime = value;
					this.SendPropertyChanged("LogDateTime");
					this.OnLogDateTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Referrer", DbType="VarChar(500)")]
		public string Referrer
		{
			get
			{
				return this._Referrer;
			}
			set
			{
				if ((this._Referrer != value))
				{
					this.OnReferrerChanging(value);
					this.SendPropertyChanging();
					this._Referrer = value;
					this.SendPropertyChanged("Referrer");
					this.OnReferrerChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591