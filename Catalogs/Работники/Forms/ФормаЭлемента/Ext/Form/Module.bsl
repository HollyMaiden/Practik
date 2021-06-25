Функция Подключение(Сервер,БД)
		cnn = Новый COMОбъект("ADODB.Connection");
		cnn.ConnectionTimeOut = 0;
		cnn.CommandTimeOut = 0; 
		cnn.connectionString = "DRIVER={MySQL ODBC 8.0 Unicode Driver}; HOST="+Сервер+"; DATABASE="+БД+"; UID=1cUsers; PWD=123456;";  
		cnn.Open();   
		if cnn.State()=0 then
			Сообщить("Не удалось соединиться с сервером");
			cnn = 0;
			Возврат Ложь;
		endif;	
		Возврат cnn;
КонецФункции

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	Сообщить(ПараметрыЗаписи);
	ОбновитьВнешниеДанные();// Вставить содержимое обработчика.
КонецПроцедуры

&НаСервере
Процедура ОбновитьВнешниеДанные()
	connection = Подключение("localhost", "mayer_pratice");
	Если Справочники.Работники.НайтиПоРеквизиту("fullName", объект.fullName) = Справочники.Работники.ПустаяСсылка() Тогда
			
		command = Новый COMОбъект("ADODB.Command");
		command.ActiveConnection = connection;
		command.CommandText = "UPDATE employees SET fullname = " + объект.fullName +
							  ", hasAccess = " + Объект.hasAccess +
							  ", role = " + Объект.role +
							  ", passport = " + Объект.passport +
							  " WHERE ";
		
		outp = Новый COMОбъект("ADODB.RecordSet");
		outp = command.Execute();
		outp.MoveFirst();
		kek = outp.Fields(0).Name;
		keke = outp.Fields(0).Value;
	КонецЕсли
КонецПроцедуры