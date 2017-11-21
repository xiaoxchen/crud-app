package com.aquent.crudapp.controller;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Pair;
import com.aquent.crudapp.domain.Person;
import com.aquent.crudapp.service.ClientService;
import com.aquent.crudapp.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("client")
public class ClientController {
    public static final String COMMAND_DELETE = "Delete";

    @Inject
    private ClientService clientService;
    @Inject
    private PersonService personService;

    /**
     * Renders the listing page.
     *
     * @return list view populated with the current list of people
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("client/list");
        List<Client> clients = clientService.listClient();
        mav.addObject("clients", clients);
        Map<Integer, Integer> map = Collections.unmodifiableMap(clients.stream()
                .collect(Collectors.toMap((e) -> e.getId(), (e) -> personService.countByClientId(e.getId()))));
        Map<Integer, List<String>> employeeName = Collections.unmodifiableMap(clients.stream()
                .collect(Collectors.toMap((e) -> e.getId(),
                        (e) -> personService.getPersonByClientId(e.getId()).stream()
                .map((k) -> k.getFirstName() + " " + k.getLastName()).collect(Collectors.toList()))));
        mav.addObject("employeeName", employeeName);
        mav.addObject("employee", map);
        return mav;
    }

    /**
     * Renders an empty form used to create a new client record.
     *
     * @return create view populated with an empty client
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("client/create");
        mav.addObject("client", new Client());
        List<Integer> allIds = personService.listPeople().stream()
                .mapToInt((e) -> e.getPersonId()).boxed().collect(Collectors.toList());
        Map<Integer, Pair> map = Collections.unmodifiableMap(allIds.stream().collect(Collectors.toMap(
                (e) -> e.intValue(),
                (e) -> new Pair(personService.readPerson(e).getFirstName() + " "+ personService.readPerson(e).getLastName(),
                        false)
        )));
        mav.addObject("people", map);
        mav.addObject("errors", new ArrayList<String>());
        return mav;
    }

    /**
     * Validates and saves a new client.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param client populated form bean for the client
     * @return redirect, or create view with errors
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ModelAndView create(Client client, @RequestParam(value = "checkbox", required = false) final String[] checkboxValue) {
        List<String> errors = clientService.validateClient(client);
        if (errors.isEmpty()) {
            int id = clientService.createClient(client);
            Set<Integer> set = new HashSet<>();
            if (checkboxValue != null && checkboxValue.length != 0){
                set = Arrays.stream(checkboxValue)
                        .mapToInt((e) -> Integer.parseInt(e)).boxed().collect(Collectors.toSet());
            }
            for (Person person : personService.listPeople()){
                if (set.contains(person.getPersonId())){
                    personService.updateClient(id, person.getPersonId());
                }
                else if (Integer.compare(person.getClient_id(), id) == 0){
                    personService.updateClient(0, person.getPersonId());
                }
            }
            return new ModelAndView("redirect:/client/list");
        } else {
            ModelAndView mav = new ModelAndView("client/create");
            mav.addObject("client", client);
            mav.addObject("errors", errors);
            return mav;
        }
    }

    /**
     * Renders an edit form for an existing client record.
     *
     * @param clientId the ID of the client to edit
     * @return edit view populated from the client record
     */
    @RequestMapping(value = "edit/{clientId}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/edit");
        mav.addObject("client", clientService.readClient(clientId));
        Set<Integer> ids = new HashSet<>(personService.getPersonIdByClientId(clientId));
        List<Integer> allIds = personService.listPeople().stream()
                .mapToInt((e) -> e.getPersonId()).boxed().collect(Collectors.toList());
        Map<Integer, Pair> map = Collections.unmodifiableMap(allIds.stream().collect(Collectors.toMap(
                (e) -> e.intValue(),
                (e) -> {
                    if (ids.contains(e)){
                        return new Pair(personService.readPerson(e).getFirstName() + " "+ personService.readPerson(e).getLastName(),
                                true);
                    }
                    else {
                        return new Pair(personService.readPerson(e).getFirstName() + " "+ personService.readPerson(e).getLastName(),
                                false);
                    }
                }
        )));
        mav.addObject("employee", ids);
        mav.addObject("people", map);
        mav.addObject("errors", new ArrayList<String>());
        return mav;
    }

    /**
     * Validates and saves an edited client.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param client populated form bean for the client
     * @return redirect, or edit view with errors
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView edit(Client client, @RequestParam(value = "checkbox", required = false) final String[] checkboxValue) {
        List<String> errors = clientService.validateClient(client);
        if (errors.isEmpty()) {
            clientService.updateClient(client);
            Set<Integer> set = new HashSet<>();
            if (checkboxValue != null && checkboxValue.length != 0){
                set = Arrays.stream(checkboxValue)
                        .mapToInt((e) -> Integer.parseInt(e)).boxed().collect(Collectors.toSet());
            }
            for (Person person : personService.listPeople()){
                if (set.contains(person.getPersonId())){
                    personService.updateClient(client.getId(), person.getPersonId());
                }
                else if (Integer.compare(person.getClient_id(), client.getId()) == 0){
                    personService.updateClient(0, person.getPersonId());
                }
            }
            return new ModelAndView("redirect:/client/list");
        } else {
            ModelAndView mav = new ModelAndView("client/edit");
            mav.addObject("client", client);
            mav.addObject("errors", errors);
            return mav;
        }
    }

    /**
     * Renders the deletion confirmation page.
     *
     * @param clientId the ID of the client to be deleted
     * @return delete view populated from the client record
     */
    @RequestMapping(value = "delete/{clientId}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/delete");
        mav.addObject("client", clientService.readClient(clientId));
        return mav;
    }

    /**
     * Handles client deletion or cancellation, redirecting to the listing page in either case.
     *
     * @param command the command field from the form
     * @param clientId the ID of the client to be deleted
     * @return redirect to the listing page
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public ModelAndView delete(@RequestParam String command, @RequestParam Integer clientId) {
        if (COMMAND_DELETE.equals(command)) {
            int count = personService.countByClientId(clientId);
            if (count != 0){
                ModelAndView mav = new ModelAndView("client/delete");
                mav.addObject("client", clientService.readClient(clientId));
                mav.addObject("error", true);
                mav.addObject("count", count);
                return mav;
            }
            clientService.deleteClient(clientId);
        }
        return new ModelAndView("redirect:/client/list");
    }
}
