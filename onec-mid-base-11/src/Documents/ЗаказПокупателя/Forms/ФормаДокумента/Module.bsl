
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды 
	
	//ПилипенкоТВ: Доработка "Во всех документах под полем Договор вывести поле Контактное лицо"
	ПолеКонтактноеЛицо = Элементы.Добавить("ПолеКонтактноеЛицо", Тип("ПолеФормы"), Элементы.ГруппаШапкаПраво);
	ПолеКонтактноеЛицо.ПутьКДанным = "Объект.ПТ_КонтактноеЛицо";
	ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
	//ПилипенкоТВ 
	
	//ПилипенкоТВ: Доработка "В заказ покупателя добавить поле «Согласованная скидка»"
	ПолеСкидка = Элементы.Добавить("ПолеСогласованнаяСкидка", Тип("ПолеФормы"), Элементы.ГруппаШапкаЛево);
	ПолеСкидка.ПутьКДанным = "Объект.ПТ_СогласованнаяСкидка";
	ПолеСкидка.Вид = ВидПоляФормы.ПолеВвода;
	
	Элементы.ПолеСогласованнаяСкидка.УстановитьДействие("ПриИзменении", "СкидкаПриИзменении");
	
	НоваяКоманда = Команды.Добавить("ПересчитатьСтоимость");
	НоваяКоманда.Заголовок = "Пересчитать стоимость";
	НоваяКоманда.Действие = "ПересчитатьСтоимостьНажатие";
	
	КомандаНаФорме = Элементы.Добавить("ПересчитатьСтоимость", Тип("КнопкаФормы"), Элементы.ГруппаШапкаЛево);
	КомандаНаФорме.ИмяКоманды = "ПересчитатьСтоимость";
	КомандаНаФорме.КнопкаПоУмолчанию = Истина;
	//ПилипенкоТВ 
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
		
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);

КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();

КонецПроцедуры


#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура СкидкаПриИзменении(Элемент)
	
	//ПилипенкоТВ: "Учитывать скидку при расчёте суммы по каждой строке табличной части" 
	ТЧ_Товары = Объект.Товары;
	ТЧ_Услуги = Объект.Услуги;
	
	Если Объект.ПТ_СогласованнаяСкидка > 100 Тогда
		ПоказатьПредупреждение(,"Размер скидки не может быть выше 100%");
		Возврат;
	ИначеЕсли  ТЧ_Товары.Количество() > 0 ИЛИ ТЧ_Услуги.Количество() > 0 Тогда 
		ЗадатьВопросПользователю();
	КонецЕсли;
	//ПилипенкоТВ
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)

	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;

	//ПилипенкоТВ: Суммирование скидок
	ОбщаяСкидка = Объект.ПТ_СогласованнаяСкидка + ТекущиеДанные.Скидка;
	
	Если ОбщаяСкидка >= 100 Тогда
		ПоказатьПредупреждение(, "Размер скидок превышает 100%, согласованная скидка не будет применена");
		КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	Иначе 
		КоэффициентСкидки = 1 - (Объект.ПТ_СогласованнаяСкидка + ТекущиеДанные.Скидка)/100;
	КонецЕсли;

	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	РассчитатьСуммуДокумента();
	//ПилипенкоТВ

КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры


&НаКлиенте
Асинх Процедура ЗадатьВопросПользователю()
	
	//ПилипенкоТВ: "Учитывать скидку при расчёте суммы по каждой строке табличной части" 
	Режим = РежимДиалогаВопрос.ДаНет;
	Ответ = Ждать ВопросАсинх("Размер скидки был изменен. Пересчитать стоимость?", Режим, 0);
	Если Ответ = КодВозвратаДиалога.Нет Тогда
		Возврат;
	Иначе
		ПересчитатьСуммуВТЧ();
	КонецЕсли;
	//ПилипенкоТВ
КонецПроцедуры 

&НаКлиенте
Процедура ПересчитатьСуммуВТЧ()

	//ПилипенкоТВ: "Учитывать скидку при расчёте суммы по каждой строке табличной части" 
	ТЧ_Товары = Объект.Товары;
	ТЧ_Услуги = Объект.Услуги;
	Для Каждого ТекущиеДанные Из ТЧ_Товары Цикл
		РассчитатьСуммуСтроки(ТекущиеДанные);
	КонецЦикла;

	Для Каждого ТекущиеДанные Из ТЧ_Услуги Цикл
		РассчитатьСуммуСтроки(ТекущиеДанные);
	КонецЦикла;
	//ПилипенкоТВ
КонецПроцедуры

&НаКлиенте 
Процедура ПересчитатьСтоимостьНажатие()

	ПересчитатьСуммуВТЧ();
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
