﻿
&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	Если Отказ = Ложь Тогда 
		СовершитьОперацию(Истина, Элементы.Накладная.ТекущиеДанные.Сумма);
	конецесли;
КонецПроцедуры

&НаСервере
Процедура СовершитьОперацию(ПрибыльЛи, Сумма)
	Оп_ия = ВнешниеИсточникиДанных.БД.Таблицы.ОперацииТаблица.СоздатьОбъект();
	Оп_ия.date = ТекущаяДата();
	Оп_ия.employeeName = ПользователиИнформационнойБазы.ТекущийПользователь().Имя;
	Оп_ия.isArrival = ПрибыльЛи;
	Оп_ия.price = ?(ПрибыльЛи, Сумма, -Сумма);
	
	СтруктураПоиска = Новый Структура;
	СтруктураПоиска.Вставить("name", "Магазин одежды");
	Оп_ия.companyID = 1; //ВнешниеИсточникиДанных.БД.Таблицы.КомпанииТаблица.НайтиСтроки(СтруктураПоиска);
	
	Оп_ия.Записать();
КонецПроцедуры