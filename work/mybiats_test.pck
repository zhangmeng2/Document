create or replace package mybiats_test AS
  procedure get_sallary_by_id(pi_id in number,po_sallay out number,po_message out varchar2);
end mybiats_test;
/
create or replace package body mybiats_test AS
  procedure get_sallary_by_id(pi_id in number,po_sallay out number,po_message out varchar2) AS
  begin   
      update sallay set fire_date=sysdate where user_id=pi_id;
      commit;
     begin
        select s.sallay
          into po_sallay
          from sallay s
          inner join test t 
          on s.user_id = t.id
         where t.id = pi_id;
      exception
      when others then
          po_message :='unknow exception,please contract to adminastor!';
      end;
   end get_sallary_by_id;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
end mybiats_test;
/
