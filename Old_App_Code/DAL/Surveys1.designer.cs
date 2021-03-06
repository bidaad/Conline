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
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="ConLine")]
	public partial class SurveysDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertSurveys(Surveys instance);
    partial void UpdateSurveys(Surveys instance);
    partial void DeleteSurveys(Surveys instance);
    partial void InsertSurveyQuestions(SurveyQuestions instance);
    partial void UpdateSurveyQuestions(SurveyQuestions instance);
    partial void DeleteSurveyQuestions(SurveyQuestions instance);
    #endregion
		
		public SurveysDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ConLineConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public SurveysDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public SurveysDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public SurveysDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public SurveysDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Surveys> Surveys
		{
			get
			{
				return this.GetTable<Surveys>();
			}
		}
		
		public System.Data.Linq.Table<SurveyQuestions> SurveyQuestions
		{
			get
			{
				return this.GetTable<SurveyQuestions>();
			}
		}
		
		public System.Data.Linq.Table<vSurveys> vSurveys
		{
			get
			{
				return this.GetTable<vSurveys>();
			}
		}
		
		public System.Data.Linq.Table<vSurveyQuestions> vSurveyQuestions
		{
			get
			{
				return this.GetTable<vSurveyQuestions>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Surveys")]
	public partial class Surveys : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Code;
		
		private string _Title;
		
		private System.Nullable<bool> _Active;
		
		private EntitySet<SurveyQuestions> _SurveyQuestions;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCodeChanging(int value);
    partial void OnCodeChanged();
    partial void OnTitleChanging(string value);
    partial void OnTitleChanged();
    partial void OnActiveChanging(System.Nullable<bool> value);
    partial void OnActiveChanged();
    #endregion
		
		public Surveys()
		{
			this._SurveyQuestions = new EntitySet<SurveyQuestions>(new Action<SurveyQuestions>(this.attach_SurveyQuestions), new Action<SurveyQuestions>(this.detach_SurveyQuestions));
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Title", DbType="NVarChar(50)")]
		public string Title
		{
			get
			{
				return this._Title;
			}
			set
			{
				if ((this._Title != value))
				{
					this.OnTitleChanging(value);
					this.SendPropertyChanging();
					this._Title = value;
					this.SendPropertyChanged("Title");
					this.OnTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Active", DbType="Bit")]
		public System.Nullable<bool> Active
		{
			get
			{
				return this._Active;
			}
			set
			{
				if ((this._Active != value))
				{
					this.OnActiveChanging(value);
					this.SendPropertyChanging();
					this._Active = value;
					this.SendPropertyChanged("Active");
					this.OnActiveChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Surveys_SurveyQuestions", Storage="_SurveyQuestions", ThisKey="Code", OtherKey="SurveyCode")]
		public EntitySet<SurveyQuestions> SurveyQuestions
		{
			get
			{
				return this._SurveyQuestions;
			}
			set
			{
				this._SurveyQuestions.Assign(value);
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
		
		private void attach_SurveyQuestions(SurveyQuestions entity)
		{
			this.SendPropertyChanging();
			entity.Surveys = this;
		}
		
		private void detach_SurveyQuestions(SurveyQuestions entity)
		{
			this.SendPropertyChanging();
			entity.Surveys = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.SurveyQuestions")]
	public partial class SurveyQuestions : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Code;
		
		private System.Nullable<int> _SurveyCode;
		
		private string _Question;
		
		private System.Nullable<decimal> _Rate;
		
		private EntityRef<Surveys> _Surveys;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCodeChanging(int value);
    partial void OnCodeChanged();
    partial void OnSurveyCodeChanging(System.Nullable<int> value);
    partial void OnSurveyCodeChanged();
    partial void OnQuestionChanging(string value);
    partial void OnQuestionChanged();
    partial void OnRateChanging(System.Nullable<decimal> value);
    partial void OnRateChanged();
    #endregion
		
		public SurveyQuestions()
		{
			this._Surveys = default(EntityRef<Surveys>);
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SurveyCode", DbType="Int")]
		public System.Nullable<int> SurveyCode
		{
			get
			{
				return this._SurveyCode;
			}
			set
			{
				if ((this._SurveyCode != value))
				{
					if (this._Surveys.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnSurveyCodeChanging(value);
					this.SendPropertyChanging();
					this._SurveyCode = value;
					this.SendPropertyChanged("SurveyCode");
					this.OnSurveyCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Question", DbType="NVarChar(50)")]
		public string Question
		{
			get
			{
				return this._Question;
			}
			set
			{
				if ((this._Question != value))
				{
					this.OnQuestionChanging(value);
					this.SendPropertyChanging();
					this._Question = value;
					this.SendPropertyChanged("Question");
					this.OnQuestionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Rate", DbType="Decimal(18,5)")]
		public System.Nullable<decimal> Rate
		{
			get
			{
				return this._Rate;
			}
			set
			{
				if ((this._Rate != value))
				{
					this.OnRateChanging(value);
					this.SendPropertyChanging();
					this._Rate = value;
					this.SendPropertyChanged("Rate");
					this.OnRateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Surveys_SurveyQuestions", Storage="_Surveys", ThisKey="SurveyCode", OtherKey="Code", IsForeignKey=true)]
		public Surveys Surveys
		{
			get
			{
				return this._Surveys.Entity;
			}
			set
			{
				Surveys previousValue = this._Surveys.Entity;
				if (((previousValue != value) 
							|| (this._Surveys.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Surveys.Entity = null;
						previousValue.SurveyQuestions.Remove(this);
					}
					this._Surveys.Entity = value;
					if ((value != null))
					{
						value.SurveyQuestions.Add(this);
						this._SurveyCode = value.Code;
					}
					else
					{
						this._SurveyCode = default(Nullable<int>);
					}
					this.SendPropertyChanged("Surveys");
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.vSurveys")]
	public partial class vSurveys
	{
		
		private int _Code;
		
		private string _Title;
		
		private System.Nullable<bool> _Active;
		
		public vSurveys()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Code", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true)]
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
					this._Code = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Title", DbType="NVarChar(50)")]
		public string Title
		{
			get
			{
				return this._Title;
			}
			set
			{
				if ((this._Title != value))
				{
					this._Title = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Active", DbType="Bit")]
		public System.Nullable<bool> Active
		{
			get
			{
				return this._Active;
			}
			set
			{
				if ((this._Active != value))
				{
					this._Active = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.vSurveyQuestions")]
	public partial class vSurveyQuestions
	{
		
		private int _Code;
		
		private System.Nullable<int> _SurveyCode;
		
		private string _Question;
		
		private System.Nullable<decimal> _Rate;
		
		public vSurveyQuestions()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Code", DbType="Int NOT NULL")]
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
					this._Code = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SurveyCode", DbType="Int")]
		public System.Nullable<int> SurveyCode
		{
			get
			{
				return this._SurveyCode;
			}
			set
			{
				if ((this._SurveyCode != value))
				{
					this._SurveyCode = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Question", DbType="NVarChar(50)")]
		public string Question
		{
			get
			{
				return this._Question;
			}
			set
			{
				if ((this._Question != value))
				{
					this._Question = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Rate", DbType="Decimal(18,5)")]
		public System.Nullable<decimal> Rate
		{
			get
			{
				return this._Rate;
			}
			set
			{
				if ((this._Rate != value))
				{
					this._Rate = value;
				}
			}
		}
	}
}
#pragma warning restore 1591
