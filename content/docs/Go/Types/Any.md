	var nf *NotFoundError
	if errors.As(err, &nf) {
		return UserError{
			Code:    "not_found",
			Message: "La tache est introuvable",
		}
	}
